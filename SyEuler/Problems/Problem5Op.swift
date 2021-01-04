//
//  Problem5Op.swift
//  SyEuler
//
//  Created by Wayne Mock on 1/3/21.
//

import Foundation

class Problem5Op: ProblemIntOp {
	/**
	Returns the smallest multiple made from the sequence of 1 - `target`.

	This implementation relies on using prime factors to generate the smallest multile, aka least common multiple.

	The least common multiple is the product of multiplying the highest power of each prime factor together of all
	the numbers in the sequence..

	Reference:
	https://en.m.wikipedia.org/wiki/Least_common_multiple

	- Parameter target: The target number to consider.
	- Returns: The smallest multiple, or `nil` if cancelled before completion.
	*/
	override func compute(target: Int) -> IntAnswer? {
		guard target > 0 else { return IntAnswer(error: "Must be > 0")}
		var primes = [Int:Int]() // keep track of each prime and its largest power
		for x in 1...target {
			primeFactors(of: x)?.forEach({ (prime, power) in
				// Have we seen this prime?
				if let currentPower = primes[prime] {
					// Yes, then store it if its power is greater than the current
					if currentPower < power {
						primes[prime] = power
					}
				} else {
					// No, then just store the power
					primes[prime] = power
				}
				report(progress: Double(x) / Double(target))
			})
		}
		// Compute the answer by raising each prime to the related power
		var answer = 1
		var overflow = false
		primes.forEach { (prime, count) in
			// This problem can overflow an Int very quickly, so watch out for it
			let result = answer.multipliedReportingOverflow(by: pow(prime, count))
			if result.overflow {
				overflow = true
			} else {
				answer = result.partialValue
			}
		}
		return overflow
			? IntAnswer(error: "Result > Int.max")
			: IntAnswer(value: answer, details: details(from: primes))
	}

	/**
	Returns the  prime factors and related power of `target`.

	Uses Wheel Factorization to determine all the factors of `target`.

	See this Wikipedia article for more details:
	https://en.m.wikipedia.org/wiki/Wheel_factorization

	- Parameter target: The target number.
	- Returns: An array of  prime factors, or `nil` if cancelled before completion.
	*/
	func primeFactors(of target: Int) -> [Int:Int]? {
		var factors = [Int]()
		var n = target
		[2, 3, 5].forEach { factor in
			while n % factor == 0 {
				factors.append(factor)
				n /= factor
			}
		}
		var k = 7, i = 0
		while k * k <= n {
			if n % k == 0 {
				factors.append(k)
				n /= k
			} else {
				k += inc[i]
				i = (i + 1) % inc.count
			}
			if isCancelled {
				return nil
			}
		}
		/// n == 1 when `target` was a prime number
		if n > 1 {
			// n is our largest prime factor
			factors.append(n)
		}
		var primes = [Int:Int]()
		factors.forEach { factor in
			let power = primes[factor] ?? 0
			primes[factor] = power + 1
		}
		return primes
	}

	/**
	Retruns all  the prime factors as a string.

	- Parameter primes: The dictionary of primes and their powers.
	- Returns: A the prime factors as a string.
	*/
	func details(from primes: [Int:Int]) -> String {
		var details = [String]()
		primes.keys.sorted().forEach { prime in
			let power = primes[prime] ?? 1
			if power == 1 {
				details.append("\(prime)")
			} else {
				details.append("\(prime)^\(power)")
			}
		}
		return details.joined(separator: " * ")
	}

	/// Increments for finding the next prime.
	let inc = [4, 2, 4, 2, 4, 6, 2, 6]
}

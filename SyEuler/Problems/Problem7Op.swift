//
//  Problem7Op.swift
//  SyEuler
//
//  Created by Wayne Mock on 1/4/21.
//

import Foundation

class Problem7Op: ProblemIntOp {
	/**
	Returns the `target`th prime. So, 10, would be the 10th priime.

	Uses simplified Wheel Factorization to determine the `target`th prime.

	Reference:
	https://en.m.wikipedia.org/wiki/Wheel_factorization

	- Parameter target: The Nth number to generate.
	- Returns: The Nth prime, or a partial answer if cancelled before completion.
	*/
	override func compute(target: Int) -> IntAnswer? {
		guard target > 0 else { return IntAnswer(error: "Must be > 0")}
		guard target > primes.count else { return IntAnswer(value: primes[target - 1]) }
		var k = 7, i = 0
		while primes.count < target && !isCancelled {
			if isPrime(k) {
				primes.append(k)
			}
			k += inc[i]
			i = (i + 1) % inc.count
			report(progress: Double(primes.count) / Double(target))
		}
		if isCancelled {
			return IntAnswer(details: "Cancled at the \(ProblemFormatter.formatNth(int: primes.count)) prime\nLast computed prime was \(ProblemFormatter.format(int: primes.last!))")
		}
		return IntAnswer(value: primes.last!)
	}

	/**
	Returns `true` if `value` is prime.

	Uses the existing `primes` array to determine if `value` is prime. If it is not a multiple of any existing prime, then it is prime.

	- Parameter value: The value to test for prime.
	- Returns: `true` if `value` is prime, otherwise `false`.
	*/
	func isPrime(_ value: Int) -> Bool {
		let sqRoot = Int(sqrt(Double(value)))
		guard value % sqRoot != 0 else { return false }
		for index in 0..<primes.count {
			let prime = primes[index]
			if value % prime == 0 {
				/// Not prime if `value` is a multiple of a prime
				return false
			}
			if sqRoot < prime {
				/// Stop looking if the primes are larger than the square root
				break
			}
		}
		return true
	}
	
	/// Initial set of primes to kick off the wheel factorization
	var primes = [2,3,5]
	/// Increments for finding the next prime.
	let inc = [4, 2, 4, 2, 4, 6, 2, 6]
}

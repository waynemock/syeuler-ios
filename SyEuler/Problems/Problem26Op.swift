//
//  Problem26Op.swift
//  SyEuler
//
//  Created by Wayne Mock on 2/24/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import Foundation

class Problem26Op: ProblemIntOp {
	/**
	Returns the value of `d < target` for which `1/d` contains the longest recurring cycle in its decimal fraction part.

	Considers prime numbers up to `target` in reverse order. These are the best candidates for the solution.

	- Parameter target: The largest denominator to consider
	- Returns: The longest recurring cycle, or `nil` if cancelled before completion.
	*/
	override func compute(target: Int) -> IntAnswer? {
		guard target > 0 else { return IntAnswer(error: "Must be > 0") }
		primes(upTo: target)
		for (index, prime) in primes.reversed().enumerated() {
			if isCancelled { return nil }
			if recurringCycleLength(of: prime) == (prime - 1) {
				return IntAnswer(value: prime)
			}
			report(progress: index, primes.count)
		}
		return IntAnswer(error: "No solution found")
	}

	func recurringCycleLength(of target: Int) -> Int {
		var n = 10, q = 0, r = 0
		var sequence = [String:Int]()
		while sequence["\(q).\(r)"] == nil && !isCancelled {
			sequence["\(q).\(r)"] = n
			q = n / target
			r = n % target
			n = r * 10
			report(progress: sequence.count, target)
		}
		return sequence.count - 1
	}

	/**
	Returns the `target`th prime. So, 10, would be the 10th priime.

	Uses simplified Wheel Factorization to determine the `target`th prime.

	Reference:
	https://en.m.wikipedia.org/wiki/Wheel_factorization

	- Parameter target: The Nth number to generate.
	- Returns: The Nth prime, or a partial answer if cancelled before completion.
	*/
	func primes(upTo target: Int) {
		primes = [2,3,5]
		guard target > primes.count else { return }
		var k = 7, i = 0
		while k < target && !isCancelled {
			if isPrime(k) {
				primes.append(k)
			}
			k += inc[i]
			i = (i + 1) % inc.count
			report(progress: k, target)
		}
	}

	/**
	Returns `true` if `value` is prime.

	Uses the existing `primes` array to determine if `value` is prime. If it is not a multiple of any existing prime, then it is prime.

	- Parameter value: The value to test for prime.
	- Returns: `true` if `value` is prime, otherwise `false`.
	*/
	func isPrime(_ value: Int) -> Bool {
		let sqRoot = sqrt(value)
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
	var primes = [Int]()
	/// Increments for finding the next prime.
	let inc = [4, 2, 4, 2, 4, 6, 2, 6]
}


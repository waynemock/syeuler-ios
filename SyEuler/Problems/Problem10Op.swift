//
//  Problem10Op.swift
//  SyEuler
//
//  Created by Wayne Mock on 1/6/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import Foundation

class Problem10Op: ProblemIntOp {
	/**
	Returns the sum of all primes below `target`.

	Uses simplified Wheel Factorization to determine the largest prime.

	Reference:
	https://en.m.wikipedia.org/wiki/Wheel_factorization

	- Parameter target: The Nth number to generate.
	- Returns: The sum, or `nil` if cancelled before completion.
	*/
	override func compute(target: Int) -> IntAnswer? {
		guard target > 0 else { return IntAnswer(error: "Must be > 0")}
		guard target > primes.count else { return IntAnswer(value: primes[target - 1]) }
		var k = 7, i = 0
		while k < target {
			if isPrime(k) {
				primes.append(k)
			}
			k += inc[i]
			i = (i + 1) % inc.count
			if isCancelled {
				return nil
			}
			report(progress: Double(k) / Double(target))
		}
		let answer = primes.reduce(0, +)
		return IntAnswer(value: answer, details: "Last prime: \(ProblemFormatter.format(int: primes.last!))")
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
	var primes = [2,3,5]
	/// Increments for finding the next prime.
	let inc = [4, 2, 4, 2, 4, 6, 2, 6]
}

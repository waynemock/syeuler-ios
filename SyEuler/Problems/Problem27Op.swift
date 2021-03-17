//
//  Problem27Op.swift
//  SyEuler
//
//  Created by Wayne Mock on 3/15/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import Foundation

class Problem27Op: ProblemIntOp {
	/**
	Returns the value of `d < target` for which `1/d` contains the longest recurring cycle in its decimal fraction part.

	- Parameter target: The largest denominator to consider
	- Returns: The longest recurring cycle, or `nil` if cancelled before completion.
	*/
	override func compute(target: Int) -> IntAnswer? {
		guard target > 0 else { return IntAnswer(error: "Must be > 0") }
		var mostA = 0, mostB = 0, most = 0
		for b in -target...target {
			for a in -target..<target {
				let count = compute(a: a, b: b)
				if count > most {
					mostA = a
					mostB = b
					most = count
				}
				if isCancelled {
					return nil
				}
			}
			report(progress: b + target, 2 * target)
		}
		return IntAnswer(value: mostA * mostB, details: "\(most) primes")
	}

	func compute(a: Int, b: Int) -> Int {
		var primes = 0
		for n in 0...abs(b) {
			let p = n*n + a*n + b
			if isPrime(p) {
				primes += 1
			} else {
				break
			}
		}
		return primes
	}

	/**
	Returns `true` if `value` is prime.

	- Parameter value: The value to test for prime.
	- Returns: `true` if `value` is prime, otherwise `false`.
	*/
	func isPrime(_ value: Int) -> Bool {
		guard value > 0 else { return false }
		let sqRoot = sqrt(value)
		guard sqRoot != 0 && value % sqRoot != 0 else { return false }
		for index in 2..<sqRoot {
			if value % index == 0 {
				return false
			}
		}
		return true
	}

}


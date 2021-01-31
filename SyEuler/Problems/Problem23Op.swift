//
//  Problem23Op.swift
//  SyEuler
//
//  Created by Wayne Mock on 1/30/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import Foundation

class Problem23Op: ProblemIntOp {
	/**
	Returns the sum of all the positive integers which cannot be written as the sum of two abundant numbers..

	Every integer greater than 20161 can be written as the sum of two abundant numbers. I know the problem says 28123, but my research
	shows it's actually 20161.
	https://en.wikipedia.org/wiki/Abundant_number

	- Parameter target: The target number to consider.
	- Returns: The sum, or `nil` if cancelled before completion.
	*/
	override func compute(target: Int) -> IntAnswer? {
		guard target > 0 else { return IntAnswer(error: "Must be > 0") }
		let max = min(target, 20161)
		abundantNumbers = []
		/// Find all abundant numbers in the range
		for number in 1...max {
			if sumOfProperDivisors(of: number) > number {
				abundantNumbers.insert(number)
			}
			if isCancelled {
				return nil
			}
			report(progress: Double(number) / Double(max) / 2)
		}
		/// Compute the sum by considering all numbers up to our `max`.
		/// Even some abundant numbers are not sums of abundant numbers.
		var sum = 0
		for nonAbundant in 1...max {
			if !isSumOfAbundantNumbers(nonAbundant) {
				sum += nonAbundant
			}
			if isCancelled {
				return nil
			}
			report(progress: 0.5 + (Double(nonAbundant) / Double(max) / 2))
		}
		return IntAnswer(value: sum, details: details)
	}

	/**
	Determines if `target` is the sum of abundant numbers.

	- Parameter target: The number to consider.
	- Returns: `true` if `target` is the sum of abundant numbers.
	*/
	func isSumOfAbundantNumbers(_ target: Int) -> Bool {
		for abundantNumber in abundantNumbers {
			if abundantNumbers.contains(target - abundantNumber) {
				return true
			}
		}
		return false
	}

	/**
	Returns the sum of all the proper divisors of `target`.

	- Parameter target: The number to consider.
	- Returns: The sum
	*/
	func sumOfProperDivisors(of target: Int) -> Int {
		let t = abs(target)
		guard t > 0 else { return 0 }
		let max = sqrt(t)
		guard max > 2 else { return 1 }
		var sum = 1
		for m in 2...max {
			if t % m == 0 {
				sum += m
				let n = t / m
				if m != n {
					sum += n
				}
			}
		}
		return sum
	}

	var details: String {
		return "Considered \(abundantNumbers.count) abundant numbers"
	}

	var abundantNumbers: Set<Int> = []
}

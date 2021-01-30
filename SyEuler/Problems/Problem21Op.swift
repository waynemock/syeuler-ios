//
//  Problem21Op.swift
//  SyEuler
//
//  Created by Wayne Mock on 1/30/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import Foundation

class Problem21Op: ProblemIntOp {
	/**
	Returns the sum of all the amicable numbers under `target`.

	- Parameter target: The target number to consider.
	- Returns: The sum, or `nil` if cancelled before completion.
	*/
	override func compute(target: Int) -> IntAnswer? {
		// We know the first pair is (220, 284) so start looking there
		guard target >= 220 else { return IntAnswer(value: 0) }
		var pairs: [(Int, Int)] = []
		var amicable: Set<Int> = []
		for a in 220...target {
			if !amicable.contains(a) {
				let b = sumOfProperDivisors(of: a)
				if a != b {
					let c = sumOfProperDivisors(of: b)
					if a == c {
						pairs.append((a, b))
						amicable.insert(a)
						amicable.insert(b)
					}
				}
			}
			if isCancelled {
				return nil
			}
			report(progress: Double(a) / Double(target))
		}
		let sum = amicable.reduce(0, +)
		return IntAnswer(value: sum, details: details(from: pairs))
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

	func details(from pairs: [(Int, Int)]) -> String {
		let asStrings = pairs.map({"\($0)"}).joined(separator: "\n")
		return "Found \(pairs.count) pairs:\n\(asStrings)"
	}
}

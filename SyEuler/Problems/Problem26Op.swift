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

	- Parameter target: The largest denominator to consider
	- Returns: The longest recurring cycle, or `nil` if cancelled before completion.
	*/
	override func compute(target: Int) -> IntAnswer? {
		guard target > 0 else { return IntAnswer(error: "Must be > 0") }
		for (index, value) in (0..<target).reversed().enumerated() {
			if isCancelled { return nil }
			/// Assumes the answer will be a cyclic number where it's recurring cycle length is itself - 1
			if recurringCycleLength(of: value) == (value - 1) {
				return IntAnswer(value: value)
			}
			report(progress: index, target)
		}
		return IntAnswer(error: "No solution found")
	}

	/**
	Computes the recurring cycle lenght of `1 / target`.
	
	- Parameter target: The value to consider
	- Returns: The length of the recurring cycle
	*/
	func recurringCycleLength(of target: Int) -> Int {
		var n = 10, q = 0, r = 0
		var qr = [String:Int]()
		while qr["\(q) \(r)"] == nil && !isCancelled {
			qr["\(q) \(r)"] = n
			q = n / target
			r = n % target
			n = r * 10
			report(progress: qr.count, target)
		}
		return qr.count - 1
	}
}


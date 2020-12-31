//
//  Problem1Op.swift
//  SyEuler
//
//  Created by Wayne Mock on 12/30/20.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import Foundation

class Problem1Op: ProblemIntOp {
	/**
	Returns the sum of all the multiples of 3 or 5 below the `target`.

	Optimized to compute the result with the fewest iterations.

	- Parameter target: Sums all multiples below this value.
	- Returns: The sum, or `nil` if cancelled before completion.
	*/
	override func compute(target: Int) -> IntAnswer? {
		guard target > 3 else { return IntAnswer(value: 0) }
		let iterations = Int(ceil(Double(target) / 3))
		var sum = 0
		for index in 1..<iterations {
			let of5 = 5 * index
			// any multiple of 5 below the target is added to the sum
			if of5 < target {
				sum += of5
			}
			let of3 = 3 * index
			// any multiple of 3 that's not also a multiple of 5 get added to the sum
			if of3 % 5 != 0 {
				sum += of3
			}
			if isCancelled {
				return nil
			}
			report(progress: Double(index) / Double(iterations))
		}
		return IntAnswer(value: sum)
	}
}

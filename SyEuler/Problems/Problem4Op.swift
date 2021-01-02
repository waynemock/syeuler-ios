//
//  Problem4Op.swift
//  SyEuler
//
//  Created by Wayne Mock on 1/1/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import Foundation

class Problem4Op: ProblemIntOp {
	/**
	Returns the largest palindrome made from the product of two`target` digit numbers.

	- Parameter target: The target number of digits.
	- Returns: The largest palindrome, or `nil` if cancelled before completion.
	*/
	override func compute(target: Int) -> IntAnswer? {
		guard target > 0 else { return IntAnswer(error: "Must be > 0")}
		let top = pow(10, target) - 1
		let bottom = pow(10, (target - 1))
		let range = top - bottom
		var palindrome = 0
		var terms = (0, 0)
		for x in stride(from: top, through: bottom, by: -1) {
			// Only consider values we have not already tried in the outer loop
			for y in stride(from: x, through: bottom, by: -1) {
				let product = x * y
				let forward = "\(x * y)"
				if forward == String(forward.reversed()) && product > palindrome {
					palindrome = product
					terms = (x, y)
				}
				if isCancelled {
					return nil
				}
			}
			report(progress: Double(top - x) / Double(range))
		}
		return IntAnswer(value: palindrome, details: "Product of \(terms.0) * \(terms.1)")
	}
}

//
//  Problem9Op.swift
//  SyEuler
//
//  Created by Wayne Mock on 1/4/21.
//

import Foundation

class Problem9Op: ProblemIntOp {
	/**
	Returns the product of `abc` where `a < b < c` and  `a + b + c == target`.

	- Parameter target: The target number to consider.
	- Returns: The product, or `nil` if cancelled before completion.
	*/
	override func compute(target: Int) -> IntAnswer? {
		guard target >= 12 else { return IntAnswer(error: "No solution found") }
		let max = target / 2
		var triplet: (Int, Int, Int)?
		for c in 5..<max {
			for b in 4..<c {
				for a in 3..<b {
					if a + b + c == target && a*a + b*b == c*c {
						triplet = (a, b, c)
						break
					}
					if isCancelled {
						return nil
					}
					report(progress: Double(c) / Double(max))
				}
			}
		}
		var answer: Int?
		var details: String?
		var error: String?
		if let triplet = triplet {
			answer = triplet.0 * triplet.1 * triplet.2
			details = "Pythagorean triplet: \(triplet)"
		} else {
			error = "No solution found"
		}
		return IntAnswer(value: answer, details: details, error: error)
	}
}

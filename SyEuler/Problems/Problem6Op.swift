//
//  Problem6Op.swift
//  SyEuler
//
//  Created by Wayne Mock on 1/4/21.
//

import Foundation

class Problem6Op: ProblemIntOp {
	/**
	Returns  the difference between the sum of the squares of the natural numbers up to `target` and the square of the sum.

	- Parameter target: The target number to consider.
	- Returns: The difference, or `nil` if cancelled before completion.
	*/
	override func compute(target: Int) -> IntAnswer? {
		guard target > 0 else { return IntAnswer(error: "Must be > 0")}
		var sumOfSquares = 0
		var sum = 0
		for x in 1...target {
			let result = x.multipliedReportingOverflow(by: x)
			if result.overflow {
				return IntAnswer(error: "Overflowed Int.max at x=\(x)")
			}
			sumOfSquares += result.partialValue
			sum += x
		}
		let result = sum.multipliedReportingOverflow(by: sum)
		if result.overflow {
			return IntAnswer(error: "Overflowed Int.max squaring \(sum)")
		}
		let squareOfSum = result.partialValue
		let answer = squareOfSum - sumOfSquares
		return IntAnswer(value: answer, details: "\(ProblemFormatter.format(int: squareOfSum)) - \(ProblemFormatter.format(int: sumOfSquares))")
	}
}

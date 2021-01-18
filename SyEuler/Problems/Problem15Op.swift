//
//  Problem15Op.swift
//  SyEuler
//
//  Created by Wayne Mock on 1/16/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import Foundation

class Problem15Op: ProblemIntOp {
	/**
	Returns the number lattice path's found in a `target` X `target` grid.

	Create's a Pascal's triangle to compute the result:
	https://en.wikipedia.org/wiki/Pascal%27s_triangle

	- Parameter target: The target number to consider.
	- Returns: The starting number", or `nil` if cancelled before completion.
	*/
	override func compute(target: Int) -> IntAnswer? {
		guard target > 0 else { return IntAnswer(error: "Must be > 0")}
		/// Create's a Pascal's triangle with double the rows as the grid.
		var rows = [[1]]
		for n in 1..<(2 * target + 1) {
			let previousRow = rows[n-1]
			var nextRow = [1]
			for i in 0..<(previousRow.count-1) {
				if let c = previousRow[i] +? previousRow[i+1] {
					nextRow.append(c)
				} else {
					return IntAnswer(error: "Result overflows Int.max at row \(n)")
				}
			}
			nextRow.append(1)
			rows.append(nextRow)
		}
		/// The result is the value in the middle of the last row of the Pascal's triangle.
		let value = rows.last![rows.last!.count/2]
		return IntAnswer(value: value)
	}
}

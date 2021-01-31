//
//  Problem24Op.swift
//  SyEuler
//
//  Created by Wayne Mock on 1/31/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import Foundation

class Problem24Op: ProblemStringOp {
	/**
	Computes  the Nth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9, where N is `target`.

	- Parameter target: The target number to consider.
	- Returns: The permutation, or `nil` if cancelled before completion.
	*/
	override func compute(target: Int) -> StringAnswer? {
		guard target > 0 else { return StringAnswer(error: "Must be > 0") }
		var digits = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
		return StringAnswer(value: digits.map({String($0)}).joined())
	}
}

/**
0123456789
0123456798
0123456978
0123456987
*/

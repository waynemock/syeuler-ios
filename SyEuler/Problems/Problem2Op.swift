//
//  Problem2Op.swift
//  SyEuler
//
//  Created by Wayne Mock on 12/30/20.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import Foundation

class Problem2Op: ProblemIntOp {
	/**
	Returns the sum of the even-valued terms in a Fibonacci sequence up to `target`.

	- Parameter target: The term to stop on.
	- Returns: The sum, or `nil` if cancelled before completion.
	*/
	override func compute(target: Int) -> Int? {
		var sum = 0
		var prev = 1
		var next = 2
		while next <= target {
			// Sum the even-valued terms
			if next % 2 == 0 {
				sum += next
			}
			// Compute the next term
			let tmp = prev
			prev = next
			next += tmp
			if isCancelled {
				return nil
			}
		}
		return sum
	}
}

//
//  Problem2.solution.swift
//  SyEuler
//
//  Created by Wayne Mock on 12/29/20.
//

import Foundation

extension Problem2 {
	/**
	Returns the sum of the even-valued terms in a Fibonacci sequence up to `target`.

	- Parameter target: The term to stop on.
	*/
	func compute(upTo target: Int) -> Int {
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
		}
		return sum
	}
}

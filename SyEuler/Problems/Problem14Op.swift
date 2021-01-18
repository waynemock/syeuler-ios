//
//  Problem14Op.swift
//  SyEuler
//
//  Created by Wayne Mock on 1/16/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import Foundation

class Problem14Op: ProblemIntOp {
	/**
	Returns the starting number, under `target`, produces the longest chain?

	The following iterative sequence is defined for the set of positive integers:
	n → n/2 (n is even)
	n → 3n + 1 (n is odd)

	- Parameter target: The target number to consider.
	- Returns: The starting number", or `nil` if cancelled before completion.
	*/
	override func compute(target: Int) -> IntAnswer? {
		guard target > 0 else { return IntAnswer(error: "Must be > 0")}
		var longest = 0
		var value = 0
		for m in 1..<target {
			var n = m
			var steps = 1
			while n > 1 {
				if n % 2 == 0 {
					n /= 2
				} else {
					n = 3 * n + 1
				}
				steps += 1
			}
			if steps > longest {
				longest = steps
				value = m
			}
			if isCancelled {
				return nil
			}
			report(progress: Double(m) / Double(target))
		}
		return IntAnswer(value: value, details: "Steps: \(longest)")
	}
}

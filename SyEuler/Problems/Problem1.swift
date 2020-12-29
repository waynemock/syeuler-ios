//
//  Pe1.swift
//  SyLinguist
//
//  Created by Wayne Mock on 12/28/20.
//

import Foundation

class Problem1: Problem {

	public override var id: Int { return 1 }
	public override var title: String { return "Multiples of 3 and 5" }
	public override var summary: String { return "Find the sum of all the multiples of 3 or 5 below 1000." }

	public override var state: State { return .completed }
	public override var startedAt: Date? { return Problem.dateFormatter.date(from: "Dec 28, 2020") }
	public override var completedAt: Date? { return Problem.dateFormatter.date(from: "Dec 28, 2020") }

	/**
	Returns the sum of all the multiples of 3 or 5 less than `below`.

	Optimized to compute the result with the fewest iterations.

	- Parameter below: Sums all multiples below this value.
	*/
	func compute(below: Int) -> Int {
		guard below > 0 else { return 0 }
		var sum = 0
		for index in 1..<below {
			let of3 = 3 * index
			if of3 >= below {
				break
			}
			let of5 = 5 * index
			if of5 < below {
				sum += of5
			}
			if of3 % 5 != 0 {
				sum += of3
			}
		}
		return sum
	}
}

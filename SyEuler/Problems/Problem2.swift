//
//  Pe2.swift
//  SyEuler
//
//  Created by Wayne Mock on 12/29/20.
//

import Foundation

class Problem2: Problem {

	public override var id: Int { return 2 }
	public override var title: String { return "Even Fibonacci numbers" }
	public override var summary: String { return "By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms." }

	public override var state: State { return .inProgress }
	public override var startedAt: Date? { return Problem.dateFormatter.date(from: "Dec 29, 2020") }

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

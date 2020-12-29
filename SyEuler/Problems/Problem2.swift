//
//  Problem2.swift
//  SyEuler
//
//  Created by Wayne Mock on 12/29/20.
//

import Foundation

class Problem2: Problem {

	public override var id: Int { return 2 }
	public override var title: String { return "Even Fibonacci numbers" }
	public override var summary: String { return "By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms." }

	public override var state: State { return .completed }
	public override var startedAt: Date? { return Problem.dateFormatter.date(from: "Dec 29, 2020") }
	public override var completedAt: Date? { return startedAt }

	/**
	Returns the sum of the even-valued terms in a Fibonacci sequence up to `target`.

	- Parameter target: Sums all even terms up to this value.
	*/
	func compute(upTo target: Int) -> Int {
		var sum = 0
		var prev = 1
		var next = 2
		while next <= target {
			if next % 2 == 0 {
				sum += next
			}
			let tmp = prev
			prev = next
			next += tmp
		}
		return sum
	}
}

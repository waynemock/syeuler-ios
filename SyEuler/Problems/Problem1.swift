//
//  Problem1.swift
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
	public override var completedAt: Date? { return startedAt }
}

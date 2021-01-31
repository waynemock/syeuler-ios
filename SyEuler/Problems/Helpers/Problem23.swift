//
//  Problem23.swift
//  SyEuler
//
//  Created by Wayne Mock on 1/30/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import Foundation

class Problem23: Problem {
	public override var id: Int { return 23 }
	public override var title: String { return "Non-abundant sums" }
	public override var summary: String { return "Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers." }
	public override var defaultInput: String { return "28123" }

	public override var state: State { return .completed }
	public override var startedAt: Date? { return Problem.dateFormatter.date(from: "Jan 30, 2021") }
	public override var completedAt: Date? { return Problem.dateFormatter.date(from: "Jan 31, 2021") }

	public override func getOp(inputs: [String], completion: @escaping ProblemOpCompletion) -> ProblemOp {
		return Problem23Op(inputs: inputs, completion: completion)
	}

	public override var references: [ProblemReference] {[
		ProblemReference(label: "Abundant numbers", link: "https://en.wikipedia.org/wiki/Abundant_number"),
	]}
}


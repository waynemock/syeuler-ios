//
//  Problem19.swift
//  SyEuler
//
//  Created by Wayne Mock on 1/20/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import Foundation

class Problem19: Problem {
	public override var id: Int { return 19 }
	public override var title: String { return "Counting Sundays" }
	public override var summary: String { return "How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?" }
	public override var defaultInput: String { return "2000" }
	public override var inputPlaceholder: String { return "Enter a year" }

	public override var state: State { return .completed }
	public override var startedAt: Date? { return Problem.dateFormatter.date(from: "Jan 20, 2021") }
	public override var completedAt: Date? { return startedAt }

	public override func getOp(inputs: [String], completion: @escaping ProblemOpCompletion) -> ProblemOp {
		return Problem19Op(inputs: inputs, completion: completion)
	}
}

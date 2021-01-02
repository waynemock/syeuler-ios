//
//  Problem1.swift
//  SyLinguist
//
//  Created by Wayne Mock on 12/28/20.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import Foundation

class Problem1: Problem {
	public override var id: Int { return 1 }
	public override var title: String { return "Multiples of 3 and 5" }
	public override var summary: String { return "Find the sum of all the multiples of 3 or 5 below 1,000." }
	public override var defaultInput: String { return "1000" }

	public override var state: State { return .completed }
	public override var startedAt: Date? { return Problem.dateFormatter.date(from: "Dec 28, 2020") }
	public override var completedAt: Date? { return startedAt }

	public override func getOp(inputs: [String], completion: @escaping ProblemOpCompletion) -> ProblemOp {
		return Problem1Op(inputs: inputs, completion: completion)
	}
}

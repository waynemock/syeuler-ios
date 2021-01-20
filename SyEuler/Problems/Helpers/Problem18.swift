//
//  Problem18.swift
//  SyEuler
//
//  Created by Wayne Mock on 1/20/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import Foundation

class Problem18: Problem {
	public override var id: Int { return 18 }
	public override var title: String { return "Maximum path sum I" }
	public override var summary: String { return "Find the maximum total from top to bottom of a triangle of numbers." }
	public override var defaultInput: String { return "15" }
	public override var inputPlaceholder: String { return "Enter the path length to sum" }

	public override var state: State { return .completed }
	public override var startedAt: Date? { return Problem.dateFormatter.date(from: "Jan 20, 2021") }
	public override var completedAt: Date? { return startedAt }

	public override func getOp(inputs: [String], completion: @escaping ProblemOpCompletion) -> ProblemOp {
		return Problem18Op(inputs: inputs, completion: completion)
	}
}

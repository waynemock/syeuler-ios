//
//  Problem22.swift
//  SyEuler
//
//  Created by Wayne Mock on 1/30/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import Foundation

class Problem22: Problem {
	public override var id: Int { return 22 }
	public override var title: String { return "Names scores" }
	public override var summary: String { return "What is the total of all the name scores in the file?" }
	public override var defaultInput: String { return "0" }
	public override var inputPlaceholder: String { return "Enter the Nth name score to compute"}

	public override var state: State { return .completed }
	public override var startedAt: Date? { return Problem.dateFormatter.date(from: "Jan 30, 2021") }
	public override var completedAt: Date? { return startedAt }

	public override func getOp(inputs: [String], completion: @escaping ProblemOpCompletion) -> ProblemOp {
		return Problem22Op(inputs: inputs, completion: completion)
	}
}


//
//  Problem2.swift
//  SyEuler
//
//  Created by Wayne Mock on 12/29/20.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import Foundation

class Problem2: Problem {
	public override var id: Int { return 2 }
	public override var title: String { return "Even Fibonacci numbers" }
	public override var summary: String { return "By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms." }
	public override var defaultInput: String { return "4000000" }

	public override var state: State { return .completed }
	public override var startedAt: Date? { return Problem.dateFormatter.date(from: "Dec 29, 2020") }
	public override var completedAt: Date? { return startedAt }

	public override func getOp(inputs: [String], completion: @escaping ProblemOpCompletion) -> ProblemOp {
		return Problem2Op(inputs: inputs, completion: completion)
	}
}

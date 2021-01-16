//
//  Problem13.swift
//  SyEuler
//
//  Created by Wayne Mock on 1/16/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import Foundation

class Problem13: Problem {
	public override var id: Int { return 13 }
	public override var title: String { return "Large sum" }
	public override var summary: String { return "Work out the first ten digits of the sum of the following one-hundred 50-digit numbers." }
	public override var defaultInput: String { return "10" }
	public override var inputPlaceholder: String { return "Enter the number of digits" }

	public override var state: State { return .inProgress }
	public override var startedAt: Date? { return Problem.dateFormatter.date(from: "Jan 16, 2021") }
	public override var completedAt: Date? { return startedAt }

	public override func getOp(inputs: [String], completion: @escaping ProblemOpCompletion) -> ProblemOp {
		return Problem13Op(inputs: inputs, completion: completion)
	}
}


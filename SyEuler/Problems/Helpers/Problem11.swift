//
//  Problem11.swift
//  SyEuler
//
//  Created by Wayne Mock on 1/13/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import Foundation

class Problem11: Problem {
	public override var id: Int { return 11 }
	public override var title: String { return "Largest product in a grid" }
	public override var summary: String { return "What is the greatest product of four adjacent numbers in the same direction (up, down, left, right, or diagonally) in the 20×20 grid?" }
	public override var defaultInput: String { return "4" }

	public override var state: State { return .completed }
	public override var startedAt: Date? { return Problem.dateFormatter.date(from: "Jan 13, 2021") }
	public override var completedAt: Date? { return startedAt }

	public override func getOp(inputs: [String], completion: @escaping ProblemOpCompletion) -> ProblemOp {
		return Problem11Op(inputs: inputs, completion: completion)
	}
}


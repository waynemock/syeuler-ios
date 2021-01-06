//
//  Problem8.swift
//  SyEuler
//
//  Created by Wayne Mock on 1/4/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import Foundation

class Problem8: Problem {
	public override var id: Int { return 8 }
	public override var title: String { return "Largest product in a series" }
	public override var summary: String { return "Find the thirteen adjacent digits in the 1000-digit number that have the greatest product. What is the value of this product?" }
	public override var defaultInput: String { return "13" }
	public override var inputPlaceholder: String { return "Enter number of digits" }

	public override var state: State { return .completed }
	public override var startedAt: Date? { return Problem.dateFormatter.date(from: "Jan 4, 2021") }
	public override var completedAt: Date? { return startedAt }

	public override func getOp(inputs: [String], completion: @escaping ProblemOpCompletion) -> ProblemOp {
		return Problem8Op(inputs: inputs, completion: completion)
	}
}

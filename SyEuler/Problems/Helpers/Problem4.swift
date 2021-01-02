//
//  Problem4.swift
//  SyEuler
//
//  Created by Wayne Mock on 1/1/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import Foundation

class Problem4: Problem {
	public override var id: Int { return 4 }
	public override var title: String { return "Largest palindrome product" }
	public override var summary: String { return "Find the largest palindrome made from the product of two 3-digit numbers." }
	public override var defaultInput: String { return "3" }
	public override var inputPlaceholder: String { return "Enter the number of digits" }

	public override var state: State { return .completed }
	public override var startedAt: Date? { return Problem.dateFormatter.date(from: "Jan 1, 2021") }
	public override var completedAt: Date? { return startedAt }

	public override func getOp(inputs: [String], completion: @escaping ProblemOpCompletion) -> ProblemOp {
		return Problem4Op(inputs: inputs, completion: completion)
	}
}

//
//  Problem6.swift
//  SyEuler
//
//  Created by Wayne Mock on 1/4/21.
//

import Foundation

class Problem6: Problem {
	public override var id: Int { return 6 }
	public override var title: String { return "Sum square difference" }
	public override var summary: String { return "Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum." }
	public override var defaultInput: String { return "100" }

	public override var state: State { return .completed }
	public override var startedAt: Date? { return Problem.dateFormatter.date(from: "Jan 4, 2021") }
	public override var completedAt: Date? { return startedAt }

	public override func getOp(inputs: [String], completion: @escaping ProblemOpCompletion) -> ProblemOp {
		return Problem6Op(inputs: inputs, completion: completion)
	}
}

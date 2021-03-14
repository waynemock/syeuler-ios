//
//  Problem26.swift
//  SyEuler
//
//  Created by Wayne Mock on 2/24/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import Foundation

class Problem26: Problem {
	public override var id: Int { return 26 }
	public override var title: String { return "Reciprocal cycles" }
	public override var summary: String { return "Find the value of d < 1000 for which 1/d contains the longest recurring cycle in its decimal fraction part." }
	public override var defaultInput: String { return "1000" }

	public override var state: State { return .inProgress }
	public override var startedAt: Date? { return Problem.dateFormatter.date(from: "Feb 24, 2021") }
//	public override var completedAt: Date? { return Problem.dateFormatter.date(from: "Feb 22, 2021") }

	public override func getOp(inputs: [String], completion: @escaping ProblemOpCompletion) -> ProblemOp {
		return Problem26Op(inputs: inputs, completion: completion)
	}

	public override var references: [ProblemReference] {[
		ProblemReference(label: "Repeating decimal", link: "https://en.wikipedia.org/wiki/Repeating_decimal"),
	]}
}


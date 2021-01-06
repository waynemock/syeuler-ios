//
//  Problem5.swift
//  SyEuler
//
//  Created by Wayne Mock on 1/3/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import Foundation

class Problem5: Problem {
	public override var id: Int { return 5 }
	public override var title: String { return "Smallest multiple" }
	public override var summary: String { return "What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?" }
	public override var defaultInput: String { return "20" }

	public override var state: State { return .completed }
	public override var startedAt: Date? { return Problem.dateFormatter.date(from: "Jan 3, 2021") }
	public override var completedAt: Date? { return startedAt }

	public override func getOp(inputs: [String], completion: @escaping ProblemOpCompletion) -> ProblemOp {
		return Problem5Op(inputs: inputs, completion: completion)
	}

	public override var references: [ProblemReference] {[
		ProblemReference(label: "Least common multiple", link: "https://en.m.wikipedia.org/wiki/Least_common_multiple"),
		ProblemReference(label: "Wheel factorization", link: "https://en.m.wikipedia.org/wiki/Wheel_factorization"),
	]}
}

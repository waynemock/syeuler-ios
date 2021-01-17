//
//  Problem14.swift
//  SyEuler
//
//  Created by Wayne Mock on 1/16/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import Foundation

class Problem14: Problem {
	public override var id: Int { return 14 }
	public override var title: String { return "Longest Collatz sequence" }
	public override var summary: String { return "Which starting number, under one million, produces the longest chain?" }
	public override var defaultInput: String { return "1000000" }

	public override var state: State { return .completed }
	public override var startedAt: Date? { return Problem.dateFormatter.date(from: "Jan 16, 2021") }
	public override var completedAt: Date? { return startedAt }

	public override func getOp(inputs: [String], completion: @escaping ProblemOpCompletion) -> ProblemOp {
		return Problem14Op(inputs: inputs, completion: completion)
	}

	public override var references: [ProblemReference] {[
		ProblemReference(label: "Collatz conjecture", link: "https://en.wikipedia.org/wiki/Collatz_conjecture"),
	]}
}

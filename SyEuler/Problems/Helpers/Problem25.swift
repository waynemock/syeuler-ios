//
//  File.swift
//  SyEuler
//
//  Created by Wayne Mock on 2/22/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import Foundation

class Problem25: Problem {
	public override var id: Int { return 25 }
	public override var title: String { return "1000-digit Fibonacci number" }
	public override var summary: String { return "What is the index of the first term in the Fibonacci sequence to contain 1000 digits?" }
	public override var defaultInput: String { return "1000" }

	public override var state: State { return .completed }
	public override var startedAt: Date? { return Problem.dateFormatter.date(from: "Feb 22, 2021") }
	public override var completedAt: Date? { return Problem.dateFormatter.date(from: "Feb 22, 2021") }

	public override func getOp(inputs: [String], completion: @escaping ProblemOpCompletion) -> ProblemOp {
		return Problem25Op(inputs: inputs, completion: completion)
	}

	public override var references: [ProblemReference] {[
		ProblemReference(label: "Binet's Formula", link: "http://www.maths.surrey.ac.uk/hosted-sites/R.Knott/Fibonacci/fibFormula.html#section2"),
	]}
}


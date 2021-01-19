//
//  Problem17.swift
//  SyEuler
//
//  Created by Wayne Mock on 1/18/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import Foundation

class Problem17: Problem {
	public override var id: Int { return 17 }
	public override var title: String { return "Number letter counts" }
	public override var summary: String { return "If all the numbers from 1 to 1000 inclusive were written out in words, how many letters would be used?" }
	public override var defaultInput: String { return "1000" }

	public override var state: State { return .completed }
	public override var startedAt: Date? { return Problem.dateFormatter.date(from: "Jan 18, 2021") }
	public override var completedAt: Date? { return startedAt }

	public override func getOp(inputs: [String], completion: @escaping ProblemOpCompletion) -> ProblemOp {
		return Problem17Op(inputs: inputs, completion: completion)
	}
}

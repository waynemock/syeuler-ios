//
//  Problem16.swift
//  SyEuler
//
//  Created by Wayne Mock on 1/17/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import Foundation

class Problem16: Problem {
	public override var id: Int { return 16 }
	public override var title: String { return "Power digit sum" }
	public override var summary: String { return "What is the sum of the digits of the number 2^1000?" }
	public override var defaultInput: String { return "1000" }

	public override var state: State { return .completed }
	public override var startedAt: Date? { return Problem.dateFormatter.date(from: "Jan 18, 2021") }
	public override var completedAt: Date? { return startedAt }

	public override func getOp(inputs: [String], completion: @escaping ProblemOpCompletion) -> ProblemOp {
		return Problem16Op(inputs: inputs, completion: completion)
	}

	public override var references: [ProblemReference] {[
		ProblemReference(label: "Swift.org BigInt Prototype", link: "https://github.com/apple/swift/blob/main/test/Prototypes/BigInt.swift"),
	]}
}

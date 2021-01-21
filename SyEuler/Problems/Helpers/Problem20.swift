//
//  Problem20.swift
//  SyEuler
//
//  Created by Wayne Mock on 1/20/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import Foundation

class Problem20: Problem {
	public override var id: Int { return 20 }
	public override var title: String { return "Factorial digit sum" }
	public override var summary: String { return "Find the sum of the digits in the number 100!" }
	public override var defaultInput: String { return "100" }

	public override var state: State { return .completed }
	public override var startedAt: Date? { return Problem.dateFormatter.date(from: "Jan 20, 2021") }
	public override var completedAt: Date? { return startedAt }

	public override func getOp(inputs: [String], completion: @escaping ProblemOpCompletion) -> ProblemOp {
		return Problem20Op(inputs: inputs, completion: completion)
	}

	public override var references: [ProblemReference] {[
		ProblemReference(label: "Swift.org BigInt Prototype", link: "https://github.com/apple/swift/blob/main/test/Prototypes/BigInt.swift"),
	]}
}

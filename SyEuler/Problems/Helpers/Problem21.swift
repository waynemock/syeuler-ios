//
//  Problem21.swift
//  SyEuler
//
//  Created by Wayne Mock on 1/30/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import Foundation

class Problem21: Problem {
	public override var id: Int { return 21 }
	public override var title: String { return "Amicable numbers" }
	public override var summary: String { return "Evaluate the sum of all the amicable numbers under 10000." }
	public override var defaultInput: String { return "10000" }

	public override var state: State { return .completed }
	public override var startedAt: Date? { return Problem.dateFormatter.date(from: "Jan 30, 2021") }
	public override var completedAt: Date? { return startedAt }

	public override func getOp(inputs: [String], completion: @escaping ProblemOpCompletion) -> ProblemOp {
		return Problem21Op(inputs: inputs, completion: completion)
	}

	public override var references: [ProblemReference] {[
		ProblemReference(label: "Amicable numbers", link: "https://en.wikipedia.org/wiki/Amicable_numbers"),
		ProblemReference(label: "Amicable pairs list for testing", link: "https://sech.me/ap/index.html"),
	]}
}

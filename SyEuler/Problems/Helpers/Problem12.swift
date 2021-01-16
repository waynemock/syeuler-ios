//
//  Problem12.swift
//  SyEuler
//
//  Created by Wayne Mock on 1/14/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import Foundation

class Problem12: Problem {
	public override var id: Int { return 12 }
	public override var title: String { return "Highly divisible triangular number" }
	public override var summary: String { return "What is the value of the first triangle number to have over five hundred divisors?" }
	public override var defaultInput: String { return "500" }
	public override var inputPlaceholder: String { return "Enter the number of divisors" }

	public override var state: State { return .completed }
	public override var startedAt: Date? { return Problem.dateFormatter.date(from: "Jan 14, 2021") }
	public override var completedAt: Date? { return Problem.dateFormatter.date(from: "Jan 16, 2021") }

	public override func getOp(inputs: [String], completion: @escaping ProblemOpCompletion) -> ProblemOp {
		return Problem12Op(inputs: inputs, completion: completion)
	}

	public override var references: [ProblemReference] {[
		ProblemReference(label: "Number of divisors forumla", link: "https://mathschallenge.net/index.php?section=faq&ref=number/number_of_divisors"),
		ProblemReference(label: "Wheel factorization", link: "https://en.m.wikipedia.org/wiki/Wheel_factorization"),
	]}
}


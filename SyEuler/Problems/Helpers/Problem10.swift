//
//  Problem10.swift
//  SyEuler
//
//  Created by Wayne Mock on 1/6/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import Foundation

class Problem10: Problem {
	public override var id: Int { return 10 }
	public override var title: String { return "Summation of primes" }
	public override var summary: String { return "Find the sum of all the primes below two million." }
	public override var defaultInput: String { return "2000000" }

	public override var state: State { return .completed }
	public override var startedAt: Date? { return Problem.dateFormatter.date(from: "Jan 6, 2021") }
	public override var completedAt: Date? { return startedAt }

	public override func getOp(inputs: [String], completion: @escaping ProblemOpCompletion) -> ProblemOp {
		return Problem10Op(inputs: inputs, completion: completion)
	}

	public override var references: [ProblemReference] {[
		ProblemReference(label: "Wheel factorization", link: "https://en.m.wikipedia.org/wiki/Wheel_factorization"),
		ProblemReference(label: "List of primes for testing", link: "https://en.wikipedia.org/wiki/List_of_prime_numbers"),
	]}
}

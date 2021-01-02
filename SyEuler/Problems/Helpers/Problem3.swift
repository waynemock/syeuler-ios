//
//  Problem3.swift
//  SyEuler
//
//  Created by Wayne Mock on 12/31/20.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import Foundation

class Problem3: Problem {
	public override var id: Int { return 3 }
	public override var title: String { return "Largest prime factor" }
	public override var summary: String { return "What is the largest prime factor of the number 600,851,475,143?" }
	public override var defaultInput: String { return "600851475143" }

	public override var state: State { return .completed }
	public override var startedAt: Date? { return Problem.dateFormatter.date(from: "Dec 31, 2020") }
	public override var completedAt: Date? { return startedAt }

	public override func getOp(inputs: [String], completion: @escaping ProblemOpCompletion) -> ProblemOp {
		return Problem3Op(inputs: inputs, completion: completion)
	}

	public override var references: [ProblemReference] {[
		ProblemReference(label: "Wheel factorization", link: "https://en.m.wikipedia.org/wiki/Wheel_factorization"),
		ProblemReference(label: "Table of prime factors", link: "https://en.wikipedia.org/wiki/Table_of_prime_factors"),
	]}
}

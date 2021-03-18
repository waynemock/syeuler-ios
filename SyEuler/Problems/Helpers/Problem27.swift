//
//  Problem27.swift
//  SyEuler
//
//  Created by Wayne Mock on 3/15/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import Foundation

class Problem27: Problem {
	public override var id: Int { return 27 }
	public override var title: String { return "Quadratic primes" }
	public override var summary: String { return "Find the product of the coefficients, a and b, for the quadratic expression n*n + an + b, that produces the maximum number of primes for consecutive values of n, starting with n = 0." }
	public override var defaultInput: String { return "1000" }

	public override var state: State { return .completed }
	public override var startedAt: Date? { return Problem.dateFormatter.date(from: "Mar 15, 2021") }
	public override var completedAt: Date? { return Problem.dateFormatter.date(from: "Mar 16, 2021") }

	public override func getOp(inputs: [String], completion: @escaping ProblemOpCompletion) -> ProblemOp {
		return Problem27Op(inputs: inputs, completion: completion)
	}

	public override var references: [ProblemReference] {[
		ProblemReference(label: "Primality test", link: "https://en.m.wikipedia.org/wiki/Primality_test"),
	]}

}


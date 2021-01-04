//
//  Problem7.swift
//  SyEuler
//
//  Created by Wayne Mock on 1/4/21.
//

import Foundation

class Problem7: Problem {
	public override var id: Int { return 7 }
	public override var title: String { return "10,001st prime" }
	public override var summary: String { return "What is the 10,001st prime number?" }
	public override var defaultInput: String { return "10001" }
	public override var inputPlaceholder: String { return "Enter the Nth prime to find" }

	public override var state: State { return .completed }
	public override var startedAt: Date? { return Problem.dateFormatter.date(from: "Jan 4, 2021") }
	public override var completedAt: Date? { return startedAt }

	public override func getOp(inputs: [String], completion: @escaping ProblemOpCompletion) -> ProblemOp {
		return Problem7Op(inputs: inputs, completion: completion)
	}

	public override var references: [ProblemReference] {[
		ProblemReference(label: "Wheel factorization", link: "https://en.m.wikipedia.org/wiki/Wheel_factorization"),
		ProblemReference(label: "List of primes for testing", link: "https://en.wikipedia.org/wiki/List_of_prime_numbers"),
	]}
}

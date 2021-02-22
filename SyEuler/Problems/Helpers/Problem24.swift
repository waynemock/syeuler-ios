//
//  Problem24.swift
//  SyEuler
//
//  Created by Wayne Mock on 1/31/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import Foundation

class Problem24: Problem {
	public override var id: Int { return 24 }
	public override var title: String { return "Lexicographic permutations" }
	public override var summary: String { return "What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?" }
	public override var defaultInput: String { return "1000000" }

	public override var state: State { return .completed }
	public override var startedAt: Date? { return Problem.dateFormatter.date(from: "Feb 20, 2021") }
	public override var completedAt: Date? { return Problem.dateFormatter.date(from: "Feb 22, 2021") }

	public override func getOp(inputs: [String], completion: @escaping ProblemOpCompletion) -> ProblemOp {
		return Problem24Op(inputs: inputs, completion: completion)
	}

	public override var references: [ProblemReference] {[
		ProblemReference(label: "Lexicographic order", link: "https://en.wikipedia.org/wiki/Lexicographic_order"),
		ProblemReference(label: "Lexicographic order algorithm", link: "https://www.geeksforgeeks.org/lexicographic-permutations-of-string/"),
	]}
}


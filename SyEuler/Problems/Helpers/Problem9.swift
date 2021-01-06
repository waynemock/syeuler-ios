//
//  Problem9.swift
//  SyEuler
//
//  Created by Wayne Mock on 1/4/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import Foundation

class Problem9: Problem {
	public override var id: Int { return 9 }
	public override var title: String { return "Special Pythagorean triplet" }
	public override var summary: String { return "There exists exactly one Pythagorean triplet for which a + b + c = 1000. Find the product abc." }
	public override var defaultInput: String { return "1000" }

	public override var state: State { return .completed }
	public override var startedAt: Date? { return Problem.dateFormatter.date(from: "Jan 5, 2021") }
	public override var completedAt: Date? { return Problem.dateFormatter.date(from: "Jan 6, 2021") }

	public override func getOp(inputs: [String], completion: @escaping ProblemOpCompletion) -> ProblemOp {
		return Problem9Op(inputs: inputs, completion: completion)
	}

	public override var references: [ProblemReference] {[
		ProblemReference(label: "Pythagorean triples formulas", link: "https://en.wikipedia.org/wiki/Formulas_for_generating_Pythagorean_triples"),
		ProblemReference(label: "Pythagorean triple", link: "https://en.wikipedia.org/wiki/Pythagorean_triple"),
	]}
}

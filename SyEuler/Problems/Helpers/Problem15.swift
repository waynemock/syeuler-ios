//
//  Problem15.swift
//  SyEuler
//
//  Created by Wayne Mock on 1/16/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import Foundation

class Problem15: Problem {
	public override var id: Int { return 15 }
	public override var title: String { return "Lattice paths" }
	public override var summary: String { return "How many such routes are there through a 20×20 grid?" }
	public override var defaultInput: String { return "20" }

	public override var state: State { return .completed }
	public override var startedAt: Date? { return Problem.dateFormatter.date(from: "Jan 16, 2021") }
	public override var completedAt: Date? { return Problem.dateFormatter.date(from: "Jan 17, 2021") }

	public override func getOp(inputs: [String], completion: @escaping ProblemOpCompletion) -> ProblemOp {
		return Problem15Op(inputs: inputs, completion: completion)
	}

	public override var references: [ProblemReference] {[
		ProblemReference(label: "The Grid Path Problem", link: "https://researchideas.ca/wmt/c6b3.html"),
		ProblemReference(label: "Lattice path", link: "https://en.wikipedia.org/wiki/Lattice_path"),
		ProblemReference(label: "Pascal's triangle", link: "https://en.wikipedia.org/wiki/Pascal%27s_triangle"),
	]}
}

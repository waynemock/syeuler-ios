//
//  Problem3.swift
//  SyEuler
//
//  Created by Wayne Mock on 12/29/20.
//

import Foundation

class Problem3: Problem {
	public override var id: Int { return 3 }
	public override var title: String { return "Largest prime factor" }
	public override var summary: String { return "What is the largest prime factor of the number 600851475143?" }

	public override var state: State { return .inProgress }
	public override var startedAt: Date? { return Problem.dateFormatter.date(from: "Dec 30, 2020") }
}

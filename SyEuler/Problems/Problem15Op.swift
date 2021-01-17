//
//  Problem15Op.swift
//  SyEuler
//
//  Created by Wayne Mock on 1/16/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import Foundation

class Problem15Op: ProblemIntOp {
	/**
	Returns the starting number, under `target`, produces the longest chain?

	- Parameter target: The target number to consider.
	- Returns: The starting number", or `nil` if cancelled before completion.
	*/
	override func compute(target: Int) -> IntAnswer? {
		guard target > 0 else { return IntAnswer(error: "Must be > 0")}
		let k = Double(target)
		let n = k + k
		let value = factorial(n) / (factorial(k) * factorial(n - k))
		return IntAnswer(value: Int(value))
	}

	/**
	Returns `target!`, or the factorial of `target`.

	- Parameter target: The number to consider.
	- Returns: The fatorial
	*/
	func factorial(_ target: Double) -> Double {
		return (1...Int(target)).map({Double($0})).reduce(1, *)
	}
}

//
//  Problem25Op.swift
//  SyEuler
//
//  Created by Wayne Mock on 2/22/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import Foundation

class Problem25Op: ProblemIntOp {
	/**
	Returns the index of the first term in the Fibonacci sequence to contain `target` digits.

	Uses a simple formula based on Binet's Formula. The number of digits in `Fib(n)` is

	`n * log10(phi) / log10(5) / 2`

	`phi = (sqrt(5) + 1) / 2`
	
	- Parameter target: The number of digits to compute to.
	- Returns: The sum, or `nil` if cancelled before completion.
	*/
	override func compute(target: Int) -> IntAnswer? {
		guard target > 0 else { return IntAnswer(error: "Must be > 0") }
		var n = 0
		var numDigits = 1
		while numDigits < target {
			n += 1
			numDigits = Double.digits(ofFib: n)
			if isCancelled {
				return nil
			}
			report(progress: numDigits, target)
		}
		return IntAnswer(value: n)
	}
}

extension Double {
	static let phi = (sqrt(5.0) + 1) / 2
	static let logPhi = log10(phi)
	static let log5by2 = log10(5.0) / 2

	/**
	Computes the number of digits of the Fibonacci number `Fib(n)`.
	- Parameter n: The Fibonacci index to consider
	- Returns: The number of digits of `Fib(n)`
	*/
	static func digits(ofFib n: Int) -> Int {
		return Int((Double(n) * Double.logPhi) - Double.log5by2) + 1
	}
}

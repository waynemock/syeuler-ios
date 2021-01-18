//
//  Problem16Op.swift
//  SyEuler
//
//  Created by Wayne Mock on 1/17/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import Foundation

class Problem16Op: ProblemIntOp {
	/**
	Returns the sum of the digits of the number 2^`target`

	I used the BigInt protoype found on the Swift.org GitHub repo:
	https://github.com/apple/swift/blob/main/test/Prototypes/BigInt.swift
	No sense in reinventing the wheel...
	
	- Parameter target: The target number to consider.
	- Returns: The sum, or `nil` if cancelled before completion.
	*/
	override func compute(target: Int) -> IntAnswer? {
		guard target > 0 else { return IntAnswer(error: "Must be > 0")}
		let value = BigInt(1) << target
		let digits = value.toString()
		let sum = digits.reduce(into: 0) { sum, letter in
			sum += Int(String(letter)) ?? 0
		}
		return IntAnswer(value: sum, details: "Digits: \(digits.count)")
	}
}

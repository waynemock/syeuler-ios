//
//  Problem20Op.swift
//  SyEuler
//
//  Created by Wayne Mock on 1/20/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import Foundation

class Problem20Op: ProblemIntOp {
	/**
	Find the sum of the digits in the number`target!`.

	I used the BigInt protoype found on the Swift.org GitHub repo:
	https://github.com/apple/swift/blob/main/test/Prototypes/BigInt.swift
	No sense in reinventing the wheel...


	- Parameter target: The target number to consider.
	- Returns: The sum, or `nil` if cancelled before completion.
	*/
	override func compute(target: Int) -> IntAnswer? {
		guard target > 0 && target <= 200 else { return IntAnswer(error: "Must be > 0 and <= 200") }
		let digits = factorial(BigInt(target)).toString()
		let sum = digits.reduce(into: 0) { sum, letter in
			sum += Int(String(letter)) ?? 0
		}
		return IntAnswer(value: sum, details: "Digits: \(digits)")
	}

	/**
	Returns `target!`, or the factorial of `target`.

	- Parameter target: The number to consider.
	- Returns: The fatorial
	*/
	func factorial(_ target: BigInt) -> BigInt {
		return (1...target).reduce(1, *)
	}
}

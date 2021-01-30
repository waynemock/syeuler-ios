//
//  IntExtension.swift
//  SyEuler
//
//  Created by Wayne Mock on 1/1/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import Foundation

func pow(_ lhs: Int, _ rhs: Int) -> Int {
	return Int(pow(Double(lhs), Double(rhs)))
}

func sqrt(_ x: Int) -> Int {
	return Int(sqrt(Double(x)))
}

func ** (_ base: Int, _ exp: Int) -> Int {
	return pow(base, exp)
}

// MARK: Addition operator with overflow

precedencegroup AdditionOverflowPrecedence {
	associativity: right
	higherThan: AdditionPrecedence
}

infix operator +? : AdditionOverflowPrecedence

func +? (_ x: Int, _ y: Int) -> Int? {
	let result = x.addingReportingOverflow(y)
	guard !result.overflow else { return nil }
	return result.partialValue
}

// MARK: Multiplication operator with overflow

precedencegroup MultiplyOverflowPrecedence {
	associativity: right
	higherThan: MultiplicationPrecedence
}

infix operator *? : MultiplyOverflowPrecedence

func *? (_ x: Int, _ y: Int) -> Int? {
	let result = x.multipliedReportingOverflow(by: y)
	guard !result.overflow else { return nil }
	return result.partialValue
}


/**
Returns `target!`, or the factorial of `target`.

- Parameter target: The number to consider.
- Returns: The fatorial
*/
func factorial(_ target: UInt) -> UInt {
	return (1...target).reduce(1, *)
}

/**
Returns `target!`, or the factorial of `target`.

- Parameter target: The number to consider.
- Returns: The fatorial
*/
func factorial(_ target: BigInt) -> BigInt {
	return (1...target).reduce(1, *)
}

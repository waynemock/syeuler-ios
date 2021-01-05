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

func ** (_ base: Int, _ exp: Int) -> Int {
	return pow(base, exp)
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


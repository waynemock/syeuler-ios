//
//  Problem10Tests.swift
//  SyEulerTests
//
//  Created by Wayne Mock on 1/6/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import XCTest
@testable import SyEuler

/**
List of primes for testing:
https://en.wikipedia.org/wiki/List_of_prime_numbers
*/

class Problem10Tests: XCTestCase {

	let problem = Problem10Op(inputs: []) { results in }

	func testTarget0() throws {
		let answer = problem.compute(target: 0)
		XCTAssertEqual(answer?.value, nil)
		XCTAssertEqual(answer?.details, nil)
		XCTAssertEqual(answer?.error, "Must be > 0")
	}

	func testTarget10() throws {
		let answer = problem.compute(target: 10)
		XCTAssertEqual(answer?.value, 17)
	}

	func testTarget20() throws {
		let answer = problem.compute(target: 20	)
		XCTAssertEqual(answer?.value, 77)
	}

	func testTarget30() throws {
		let answer = problem.compute(target: 30)
		XCTAssertEqual(answer?.value, 129)
	}

	func testTarget40() throws {
		let answer = problem.compute(target: 40)
		XCTAssertEqual(answer?.value, 197)
	}

	func testTarget50() throws {
		let answer = problem.compute(target: 50)
		XCTAssertEqual(answer?.value, 328)
	}

	func testTarget2m() throws {
		let answer = problem.compute(target: 2000000)
		XCTAssertEqual(answer?.value, 142913828922)
	}
}

//
//  Problem8Tests.swift
//  SyEulerTests
//
//  Created by Wayne Mock on 1/4/21.
//

import XCTest
@testable import SyEuler

class Problem8Tests: XCTestCase {

	let problem = Problem8Op(inputs: []) { results in }

	func testTarget0() throws {
		let answer = problem.compute(target: 0)
		XCTAssertEqual(answer?.value, nil)
		XCTAssertEqual(answer?.details, nil)
		XCTAssertEqual(answer?.error, "Must be > 0")
	}

	func testTarget1() throws {
		let answer = problem.compute(target: 1)
		XCTAssertEqual(answer?.value, 9)
	}

	func testTarget2() throws {
		let answer = problem.compute(target: 2)
		XCTAssertEqual(answer?.value, 81)
	}

	func testTarget3() throws {
		let answer = problem.compute(target: 3)
		XCTAssertEqual(answer?.value, 648)
	}

	func testTarget4() throws {
		let answer = problem.compute(target: 4)
		XCTAssertEqual(answer?.value, 5832)
	}

	func testTarget13() throws {
		let answer = problem.compute(target: 13)
		XCTAssertEqual(answer?.value, 23514624000)
	}
}

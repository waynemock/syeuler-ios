//
//  Problem6Tests.swift
//  SyEulerTests
//
//  Created by Wayne Mock on 1/4/21.
//

import XCTest
@testable import SyEuler

class Problem6Tests: XCTestCase {
	let problem = Problem6Op(inputs: []) { results in }

	func testTarget0() throws {
		let answer = problem.compute(target: 0)
		XCTAssertEqual(answer?.value, nil)
		XCTAssertEqual(answer?.error, "Must be > 0")
	}

	func testTarget1() throws {
		let answer = problem.compute(target: 1)
		XCTAssertEqual(answer?.value, 0)
	}

	func testTarget2() throws {
		let answer = problem.compute(target: 2)
		XCTAssertEqual(answer?.value, 4)
	}

	func testTarget3() throws {
		let answer = problem.compute(target: 3)
		XCTAssertEqual(answer?.value, 22)
	}

	func testTarget4() throws {
		let answer = problem.compute(target: 4)
		XCTAssertEqual(answer?.value, 70)
	}

	func testTarget5() throws {
		let answer = problem.compute(target: 5)
		XCTAssertEqual(answer?.value, 170)
	}

	func testTarget10() throws {
		let answer = problem.compute(target: 10)
		XCTAssertEqual(answer?.value, 2640)
	}

	func testTarget100() throws {
		let answer = problem.compute(target: 100)
		XCTAssertEqual(answer?.value, 25164150)
	}
}

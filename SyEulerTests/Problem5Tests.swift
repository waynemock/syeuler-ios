//
//  Problem5Tests.swift
//  SyEulerTests
//
//  Created by Wayne Mock on 1/3/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import XCTest
@testable import SyEuler

class Problem5Tests: XCTestCase {

	let problem = Problem5Op(inputs: []) { results in }

	func testTarget0() throws {
		let answer = problem.compute(target: 0)
		XCTAssertEqual(answer?.value, nil)
		XCTAssertEqual(answer?.details, nil)
		XCTAssertEqual(answer?.error, "Must be > 0")
	}

	func testTarget1() throws {
		let answer = problem.compute(target: 1)
		XCTAssertEqual(answer?.value, 1)
		XCTAssertEqual(answer?.details, "")
		XCTAssertEqual(answer?.error, nil)
	}

	func testTarget4() throws {
		let answer = problem.compute(target: 4)
		XCTAssertEqual(answer?.value, 12)
		XCTAssertEqual(answer?.details, "2^2 * 3")
		XCTAssertEqual(answer?.error, nil)
	}

	func testTarget5() throws {
		let answer = problem.compute(target: 5)
		XCTAssertEqual(answer?.value, 60)
		XCTAssertEqual(answer?.details, "2^2 * 3 * 5")
		XCTAssertEqual(answer?.error, nil)
	}

	func testTarget6() throws {
		let answer = problem.compute(target: 6)
		XCTAssertEqual(answer?.value, 60)
		XCTAssertEqual(answer?.details, "2^2 * 3 * 5")
		XCTAssertEqual(answer?.error, nil)
	}

	func testTarget7() throws {
		let answer = problem.compute(target: 7)
		XCTAssertEqual(answer?.value, 420)
		XCTAssertEqual(answer?.details, "2^2 * 3 * 5 * 7")
		XCTAssertEqual(answer?.error, nil)
	}

	func testTarget8() throws {
		let answer = problem.compute(target: 8)
		XCTAssertEqual(answer?.value, 840)
		XCTAssertEqual(answer?.details, "2^3 * 3 * 5 * 7")
		XCTAssertEqual(answer?.error, nil)
	}

	func testTarget9() throws {
		let answer = problem.compute(target: 9)
		XCTAssertEqual(answer?.value, 2520)
		XCTAssertEqual(answer?.details, "2^3 * 3^2 * 5 * 7")
		XCTAssertEqual(answer?.error, nil)
	}

	func testTarget10() throws {
		let answer = problem.compute(target: 10)
		XCTAssertEqual(answer?.value, 2520)
		XCTAssertEqual(answer?.details, "2^3 * 3^2 * 5 * 7")
		XCTAssertEqual(answer?.error, nil)
	}

	func testTarget20() throws {
		let answer = problem.compute(target: 20)
		XCTAssertEqual(answer?.value, 232792560)
		XCTAssertEqual(answer?.details, "2^4 * 3^2 * 5 * 7 * 11 * 13 * 17 * 19")
		XCTAssertEqual(answer?.error, nil)
	}
}

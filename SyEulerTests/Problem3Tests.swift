//
//  Problem3Tests.swift
//  SyEulerTests
//
//  Created by Wayne Mock on 12/31/20.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import XCTest
@testable import SyEuler

/// Test data generated from this Wikipedia article:
/// https://en.wikipedia.org/wiki/Table_of_prime_factors

class Problem3Tests: XCTestCase {

	let problem = Problem3Op(inputs: []) { results in }

	func testTargetMinus1() throws {
		XCTAssertEqual(problem.compute(target: -1), 0)
	}

	func testTarget0() throws {
		XCTAssertEqual(problem.compute(target: 0), 0)
	}

	func testTarget1() throws {
		XCTAssertEqual(problem.compute(target: 1), 1)
	}

	func testTarget2() throws {
		XCTAssertEqual(problem.compute(target: 2), 2)
	}

	func testTarget3() throws {
		XCTAssertEqual(problem.compute(target: 3), 3)
	}

	func testTarget4() throws {
		XCTAssertEqual(problem.compute(target: 4), 2)
	}

	func testTarget5() throws {
		XCTAssertEqual(problem.compute(target: 5), 5)
	}

	func testTarget6() throws {
		XCTAssertEqual(problem.compute(target: 6), 3)
	}

	func testTarget7() throws {
		XCTAssertEqual(problem.compute(target: 7), 7)
	}

	func testTarget8() throws {
		XCTAssertEqual(problem.compute(target: 8), 2)
	}

	func testTarget9() throws {
		XCTAssertEqual(problem.compute(target: 9), 3)
	}

	func testTarget11() throws {
		XCTAssertEqual(problem.compute(target: 11), 11)
	}

	func testTarget92() throws {
		XCTAssertEqual(problem.compute(target: 92), 23)
	}

	func testTarget930() throws {
		XCTAssertEqual(problem.compute(target: 930), 31)
	}

	func testTarget966() throws {
		XCTAssertEqual(problem.compute(target: 966), 23)
	}

	func testTarget997() throws {
		XCTAssertEqual(problem.compute(target: 997), 997)
	}

	func testTarget998() throws {
		XCTAssertEqual(problem.compute(target: 998), 499)
	}

	func testTarget999() throws {
		XCTAssertEqual(problem.compute(target: 999), 37)
	}
}

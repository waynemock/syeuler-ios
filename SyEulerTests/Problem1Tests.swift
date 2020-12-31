//
//  Problem1Tests.swift
//  SyEulerTests
//
//  Created by Wayne Mock on 12/28/20.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import XCTest
@testable import SyEuler

class Problem1Tests: XCTestCase {

	let problem = Problem1Op(inputs: []) { results in }

	func testTargetMinus1() throws {
		XCTAssertEqual(problem.compute(target: -1), 0)
	}

	func testTarget0() throws {
		XCTAssertEqual(problem.compute(target: 0), 0)
	}

	func testTarget1() throws {
		XCTAssertEqual(problem.compute(target: 1), 0)
	}

	func testTarget2() throws {
		XCTAssertEqual(problem.compute(target: 2), 0)
	}

	func testTarget3() throws {
		XCTAssertEqual(problem.compute(target: 3), 0)
	}

	func testTarget4() throws {
		XCTAssertEqual(problem.compute(target: 4), 3)
	}

	func testTarget6() throws {
		XCTAssertEqual(problem.compute(target: 6), 8)
	}

	func testTarget10() throws {
		XCTAssertEqual(problem.compute(target: 10), 23)
	}

	func testTarget15() throws {
		XCTAssertEqual(problem.compute(target: 15), 45)
	}

	func testTarget18() throws {
		XCTAssertEqual(problem.compute(target: 18), 60)
	}

	func testTarget20() throws {
		XCTAssertEqual(problem.compute(target: 20), 78)
	}

	func testTarget21() throws {
		XCTAssertEqual(problem.compute(target: 21), 98)
	}

	func testTarget24() throws {
		XCTAssertEqual(problem.compute(target: 24), 119)
	}

	func testTarget25() throws {
		XCTAssertEqual(problem.compute(target: 25), 143)
	}

	func testTarget26() throws {
		XCTAssertEqual(problem.compute(target: 26), 168)
	}

	func testTarget28() throws {
		XCTAssertEqual(problem.compute(target: 28), 195)
	}

	func testTarget31() throws {
		XCTAssertEqual(problem.compute(target: 31), 225)
	}

	func testTarget1000() throws {
		XCTAssertEqual(problem.compute(target: 1000), 233168)
    }
}

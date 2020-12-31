//
//  Problem2Tests.swift
//  SyEulerTests
//
//  Created by Wayne Mock on 12/29/20.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import XCTest
@testable import SyEuler

class Problem2Tests: XCTestCase {

	let problem = Problem2Op(inputs: []) { results in }

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
		XCTAssertEqual(problem.compute(target: 2), 2)
	}

	func testTarget8() throws {
		XCTAssertEqual(problem.compute(target: 8), 10)
	}

	func testTarget34() throws {
		XCTAssertEqual(problem.compute(target: 34), 44)
	}

	func testTarget144() throws {
		XCTAssertEqual(problem.compute(target: 144), 188)
	}

	func testTarget400() throws {
		XCTAssertEqual(problem.compute(target: 400), 188)
	}

	func testTarget2584() throws {
		XCTAssertEqual(problem.compute(target: 2584), 3382)
	}

	func testTarget4k() throws {
		XCTAssertEqual(problem.compute(target: 4000), 3382)
	}

	func testTarget317811() throws {
		XCTAssertEqual(problem.compute(target: 317811), 257114)
	}

	func testTarget400k() throws {
		XCTAssertEqual(problem.compute(target: 400000), 257114)
	}

	func testTarget3524578() throws {
		XCTAssertEqual(problem.compute(target: 3524578), 4613732)
	}

	func testTarget4m() throws {
		XCTAssertEqual(problem.compute(target: 4000000), 4613732)
	}

}

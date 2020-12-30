//
//  Problem2Tests.swift
//  SyEulerTests
//
//  Created by Wayne Mock on 12/29/20.
//

import XCTest
@testable import SyEuler

class Problem2Tests: XCTestCase {

	let problem = Problem2()

	func testUpToMinus1() throws {
		XCTAssertEqual(problem.compute(upTo: -1), 0)
	}

	func testUpTo0() throws {
		XCTAssertEqual(problem.compute(upTo: 0), 0)
	}

	func testUpTo1() throws {
		XCTAssertEqual(problem.compute(upTo: 1), 0)
	}

	func testUpTo2() throws {
		XCTAssertEqual(problem.compute(upTo: 2), 2)
	}

	func testUpTo8() throws {
		XCTAssertEqual(problem.compute(upTo: 8), 10)
	}

	func testUpTo34() throws {
		XCTAssertEqual(problem.compute(upTo: 34), 44)
	}

	func testUpTo144() throws {
		XCTAssertEqual(problem.compute(upTo: 144), 188)
	}

	func testUpTo400() throws {
		XCTAssertEqual(problem.compute(upTo: 400), 188)
	}

	func testUpTo2584() throws {
		XCTAssertEqual(problem.compute(upTo: 2584), 3382)
	}

	func testUpTo4k() throws {
		XCTAssertEqual(problem.compute(upTo: 4000), 3382)
	}

	func testUpTo317811() throws {
		XCTAssertEqual(problem.compute(upTo: 317811), 257114)
	}

	func testUpTo400k() throws {
		XCTAssertEqual(problem.compute(upTo: 400000), 257114)
	}

	func testUpTo3524578() throws {
		XCTAssertEqual(problem.compute(upTo: 3524578), 4613732)
	}

	func testUpTo4m() throws {
		XCTAssertEqual(problem.compute(upTo: 4000000), 4613732)
	}

}

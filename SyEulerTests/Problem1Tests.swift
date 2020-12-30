//
//  Problem1Tests.swift
//  SyEulerTests
//
//  Created by Wayne Mock on 12/28/20.
//

import XCTest
@testable import SyEuler

class Problem1Tests: XCTestCase {

	let problem = Problem1()

	func testBelowMinus1() throws {
		XCTAssertEqual(problem.compute(below: -1), 0)
	}

	func testBelow0() throws {
		XCTAssertEqual(problem.compute(below: 0), 0)
	}

	func testBelow1() throws {
		XCTAssertEqual(problem.compute(below: 1), 0)
	}

	func testBelow2() throws {
		XCTAssertEqual(problem.compute(below: 2), 0)
	}

	func testBelow3() throws {
		XCTAssertEqual(problem.compute(below: 3), 0)
	}

	func testBelow4() throws {
		XCTAssertEqual(problem.compute(below: 4), 3)
	}

	func testBelow6() throws {
		XCTAssertEqual(problem.compute(below: 6), 8)
	}

	func testBelow10() throws {
		XCTAssertEqual(problem.compute(below: 10), 23)
	}

	func testBelow15() throws {
		XCTAssertEqual(problem.compute(below: 15), 45)
	}

	func testBelow18() throws {
		XCTAssertEqual(problem.compute(below: 18), 60)
	}

	func testBelow20() throws {
		XCTAssertEqual(problem.compute(below: 20), 78)
	}

	func testBelow21() throws {
		XCTAssertEqual(problem.compute(below: 21), 98)
	}

	func testBelow24() throws {
		XCTAssertEqual(problem.compute(below: 24), 119)
	}

	func testBelow25() throws {
		XCTAssertEqual(problem.compute(below: 25), 143)
	}

	func testBelow26() throws {
		XCTAssertEqual(problem.compute(below: 26), 168)
	}

	func testBelow28() throws {
		XCTAssertEqual(problem.compute(below: 28), 195)
	}

	func testBelow31() throws {
		XCTAssertEqual(problem.compute(below: 31), 225)
	}

	func testBelow1000() throws {
		XCTAssertEqual(problem.compute(below: 1000), 233168)
    }
}

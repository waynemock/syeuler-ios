//
//  Problem1Tests.swift
//  SyEulerTests
//
//  Created by Wayne Mock on 12/28/20.
//

import XCTest
@testable import SyEuler

class Problem1Tests: XCTestCase {

	let problem = Problem1Op(inputs: []) { results in }

	func testtargetMinus1() throws {
		XCTAssertEqual(problem.compute(target: -1), 0)
	}

	func testtarget0() throws {
		XCTAssertEqual(problem.compute(target: 0), 0)
	}

	func testtarget1() throws {
		XCTAssertEqual(problem.compute(target: 1), 0)
	}

	func testtarget2() throws {
		XCTAssertEqual(problem.compute(target: 2), 0)
	}

	func testtarget3() throws {
		XCTAssertEqual(problem.compute(target: 3), 0)
	}

	func testtarget4() throws {
		XCTAssertEqual(problem.compute(target: 4), 3)
	}

	func testtarget6() throws {
		XCTAssertEqual(problem.compute(target: 6), 8)
	}

	func testtarget10() throws {
		XCTAssertEqual(problem.compute(target: 10), 23)
	}

	func testtarget15() throws {
		XCTAssertEqual(problem.compute(target: 15), 45)
	}

	func testtarget18() throws {
		XCTAssertEqual(problem.compute(target: 18), 60)
	}

	func testtarget20() throws {
		XCTAssertEqual(problem.compute(target: 20), 78)
	}

	func testtarget21() throws {
		XCTAssertEqual(problem.compute(target: 21), 98)
	}

	func testtarget24() throws {
		XCTAssertEqual(problem.compute(target: 24), 119)
	}

	func testtarget25() throws {
		XCTAssertEqual(problem.compute(target: 25), 143)
	}

	func testtarget26() throws {
		XCTAssertEqual(problem.compute(target: 26), 168)
	}

	func testtarget28() throws {
		XCTAssertEqual(problem.compute(target: 28), 195)
	}

	func testtarget31() throws {
		XCTAssertEqual(problem.compute(target: 31), 225)
	}

	func testtarget1000() throws {
		XCTAssertEqual(problem.compute(target: 1000), 233168)
    }
}

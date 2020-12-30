//
//  Problem2Tests.swift
//  SyEulerTests
//
//  Created by Wayne Mock on 12/29/20.
//

import XCTest
@testable import SyEuler

class Problem2Tests: XCTestCase {

	let problem = Problem2Op(inputs: []) { results in }

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
		XCTAssertEqual(problem.compute(target: 2), 2)
	}

	func testtarget8() throws {
		XCTAssertEqual(problem.compute(target: 8), 10)
	}

	func testtarget34() throws {
		XCTAssertEqual(problem.compute(target: 34), 44)
	}

	func testtarget144() throws {
		XCTAssertEqual(problem.compute(target: 144), 188)
	}

	func testtarget400() throws {
		XCTAssertEqual(problem.compute(target: 400), 188)
	}

	func testtarget2584() throws {
		XCTAssertEqual(problem.compute(target: 2584), 3382)
	}

	func testtarget4k() throws {
		XCTAssertEqual(problem.compute(target: 4000), 3382)
	}

	func testtarget317811() throws {
		XCTAssertEqual(problem.compute(target: 317811), 257114)
	}

	func testtarget400k() throws {
		XCTAssertEqual(problem.compute(target: 400000), 257114)
	}

	func testtarget3524578() throws {
		XCTAssertEqual(problem.compute(target: 3524578), 4613732)
	}

	func testtarget4m() throws {
		XCTAssertEqual(problem.compute(target: 4000000), 4613732)
	}

}

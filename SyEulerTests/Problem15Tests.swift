//
//  Problem15Tests.swift
//  SyEulerTests
//
//  Created by Wayne Mock on 1/17/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import XCTest
@testable import SyEuler

class Problem15Tests: XCTestCase {

	let problem = Problem15Op(inputs: []) { results in }

	func testTargetOutOfRange() throws {
		let answer = problem.compute(target: 0)
		XCTAssertEqual(answer?.value, nil)
		XCTAssertEqual(answer?.details, nil)
		XCTAssertEqual(answer?.error, "Must be > 0")
	}

	func test20() throws {
		let answer = problem.compute(target: 20)
		XCTAssertEqual(answer?.value, 137846528820)
	}

	func testAnswers() throws {
		[(1, 2), (2, 6), (3, 20), (4, 70), (5, 252), (6, 924)].forEach { (n, value) in
			let answer = problem.compute(target: n)
			XCTAssertEqual(answer?.value, value)
		}
	}
}


//
//  Problem12Tests.swift
//  SyEulerTests
//
//  Created by Wayne Mock on 1/14/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import XCTest
@testable import SyEuler

class Problem12Tests: XCTestCase {

	let problem = Problem12Op(inputs: []) { results in }

	func testTargetOutOfRange() throws {
		let answer = problem.compute(target: 0)
		XCTAssertEqual(answer?.value, nil)
		XCTAssertEqual(answer?.details, nil)
		XCTAssertEqual(answer?.error, "Must be > 0")
	}

	func testAnswers() throws {
		[(1, 3), (2, 6), (3, 6), (4, 28), (5, 28), (6, 36), (500, 76576500)].forEach { (n, value) in
			let answer = problem.compute(target: n)
			XCTAssertEqual(answer?.value, value)
		}
	}
}

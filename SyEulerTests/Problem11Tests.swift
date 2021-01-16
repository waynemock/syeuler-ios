//
//  Problem11Tests.swift
//  SyEulerTests
//
//  Created by Wayne Mock on 1/14/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import XCTest
@testable import SyEuler

class Problem11Tests: XCTestCase {

	let problem = Problem11Op(inputs: []) { results in }

	func testTargetOutOfRange() throws {
		[0, 11].forEach { n in
			let answer = problem.compute(target: n)
			XCTAssertEqual(answer?.value, nil)
			XCTAssertEqual(answer?.details, nil)
			XCTAssertEqual(answer?.error, "Must be > 0 and <= 10")
		}
	}

	func testAnswers() throws {
		[(1, 99), (2, 9603), (3, 811502), (4, 70600674)].forEach { (n, value) in
			let answer = problem.compute(target: n)
			XCTAssertEqual(answer?.value, value)
		}
	}

	func testResults() throws {
		for n in 1...10 {
			let answer = problem.compute(target: n)
			XCTAssertEqual(answer?.value, problem.values.reduce(1, { $0 * $1 }))
		}
	}
}

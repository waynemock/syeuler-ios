//
//  Problem27Tests.swift
//  SyEulerTests
//
//  Created by Wayne Mock on 3/17/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import XCTest
@testable import SyEuler

class Problem27Tests: XCTestCase {

	let problem = Problem27Op(inputs: []) { results in }

	func testTargetOutOfRange() throws {
		[0, 1].forEach { n in
			let answer = problem.compute(target: n)
			XCTAssertEqual(answer?.value, nil)
			XCTAssertEqual(answer?.details, nil)
			XCTAssertEqual(answer?.error, "No solution")
		}
	}

	func test() throws {
		let answer = problem.compute(target: 1_000)
		XCTAssertEqual(answer?.value, -59231)
	}

	func testAnswers() throws {
		[(2, -2), (3, -6), (10, 63), (100, 3953)].forEach { (n, value) in
			let answer = problem.compute(target: n)
			XCTAssertEqual(answer?.value, value)
		}
	}
}

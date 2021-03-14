//
//  Problem26Tests.swift
//  SyEulerTests
//
//  Created by Wayne Mock on 3/14/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import XCTest
@testable import SyEuler

class Problem26Tests: XCTestCase {

	let problem = Problem26Op(inputs: []) { results in }

	func testTargetOutOfRange() throws {
		[0, -1].forEach { n in
			let answer = problem.compute(target: n)
			XCTAssertEqual(answer?.value, nil)
			XCTAssertEqual(answer?.details, nil)
			XCTAssertEqual(answer?.error, "Must be > 0")
		}
	}

	func test() throws {
		let answer = problem.compute(target: 1_000)
		XCTAssertEqual(answer?.value, 983)
	}

	func testAnswers() throws {
		[(10, 7), (20, 19), (30, 29), (100, 97)].forEach { (n, value) in
			let answer = problem.compute(target: n)
			XCTAssertEqual(answer?.value, value)
		}
	}
}

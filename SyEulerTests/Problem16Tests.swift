//
//  Problem16Tests.swift
//  SyEulerTests
//
//  Created by Wayne Mock on 1/18/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import XCTest
@testable import SyEuler

class Problem16Tests: XCTestCase {

	let problem = Problem16Op(inputs: []) { results in }

	func testTargetOutOfRange() throws {
		[0, 2001].forEach { n in
			let answer = problem.compute(target: n)
			XCTAssertEqual(answer?.value, nil)
			XCTAssertEqual(answer?.details, nil)
			XCTAssertEqual(answer?.error, "Must be > 0 and <= 2000")
		}
	}

	func test1000() throws {
		let answer = problem.compute(target: 1000)
		XCTAssertEqual(answer?.value, 1366)
	}

	func testAnswers() throws {
		[(1, 2), (2, 4), (3, 8), (4, 7), (5, 5), (15, 26)].forEach { (n, value) in
			let answer = problem.compute(target: n)
			XCTAssertEqual(answer?.value, value)
		}
	}
}


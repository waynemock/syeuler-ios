//
//  Problem19Tests.swift
//  SyEulerTests
//
//  Created by Wayne Mock on 1/20/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import XCTest
@testable import SyEuler

class Problem19Tests: XCTestCase {

	let problem = Problem19Op(inputs: []) { results in }

	func testTargetOutOfRange() throws {
		[1900, 2001].forEach { n in
			let answer = problem.compute(target: n)
			XCTAssertEqual(answer?.value, nil)
			XCTAssertEqual(answer?.details, nil)
			XCTAssertEqual(answer?.error, "Must be > 1900 and <= 2000")
		}
	}

	func test2000() throws {
		let answer = problem.compute(target: 2000)
		XCTAssertEqual(answer?.value, 171)
	}

	func testAnswers() throws {
		[(1901, 2), (1902, 3), (1903, 6), (1904, 7), (1905, 9), (1906, 11)].forEach { (n, value) in
			let answer = problem.compute(target: n)
			XCTAssertEqual(answer?.value, value)
		}
	}
}

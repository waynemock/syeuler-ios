//
//  Problem18Tests.swift
//  SyEulerTests
//
//  Created by Wayne Mock on 1/20/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import XCTest
@testable import SyEuler

class Problem18Tests: XCTestCase {

	let problem = Problem18Op(inputs: []) { results in }

	func testTargetOutOfRange() throws {
		[0, 16].forEach { n in
			let answer = problem.compute(target: n)
			XCTAssertEqual(answer?.value, nil)
			XCTAssertEqual(answer?.details, nil)
			XCTAssertEqual(answer?.error, "Must be > 0 and <= 15")
		}
	}

	func test15() throws {
		let answer = problem.compute(target: 15)
		XCTAssertEqual(answer?.value, 1074)
	}

	func testAnswers() throws {
		[(1, 75), (2, 170), (3, 221), (14, 981)].forEach { (n, value) in
			let answer = problem.compute(target: n)
			XCTAssertEqual(answer?.value, value)
		}
	}
}

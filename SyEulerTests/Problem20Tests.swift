//
//  Problem20Tests.swift
//  SyEulerTests
//
//  Created by Wayne Mock on 1/20/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import XCTest
@testable import SyEuler

class Problem20Tests: XCTestCase {

	let problem = Problem20Op(inputs: []) { results in }

	func testTargetOutOfRange() throws {
		[0].forEach { n in
			let answer = problem.compute(target: n)
			XCTAssertEqual(answer?.value, nil)
			XCTAssertEqual(answer?.details, nil)
			XCTAssertEqual(answer?.error, "Must be > 0 and <= 200")
		}
	}

	func test100() throws {
		let answer = problem.compute(target: 100)
		XCTAssertEqual(answer?.value, 648)
	}

	func testAnswers() throws {
		[(1, 1), (2, 2), (3, 6), (4, 6), (9, 27), (10, 27)].forEach { (n, value) in
			let answer = problem.compute(target: n)
			XCTAssertEqual(answer?.value, value)
		}
	}
}

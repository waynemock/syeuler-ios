//
//  Problem25Tests.swift
//  SyEulerTests
//
//  Created by Wayne Mock on 2/22/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import XCTest
@testable import SyEuler

class Problem25Tests: XCTestCase {

	let problem = Problem25Op(inputs: []) { results in }

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
		XCTAssertEqual(answer?.value, 4782)
	}

	func testAnswers() throws {
		[(1, 0), (2, 7), (3, 12), (100, 476)].forEach { (n, value) in
			let answer = problem.compute(target: n)
			XCTAssertEqual(answer?.value, value)
		}
	}
}

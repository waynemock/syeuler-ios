//
//  Problem17Tests.swift
//  SyEulerTests
//
//  Created by Wayne Mock on 1/18/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import XCTest
@testable import SyEuler

class Problem17Tests: XCTestCase {

	let problem = Problem17Op(inputs: []) { results in }

	func testTargetOutOfRange() throws {
		let answer = problem.compute(target: 0)
		XCTAssertEqual(answer?.value, nil)
		XCTAssertEqual(answer?.details, nil)
		XCTAssertEqual(answer?.error, "Must be > 0")
	}

	func test1000() throws {
		let answer = problem.compute(target: 1000)
		XCTAssertEqual(answer?.value, 21124)
	}

	func testAnswers() throws {
		[(1, 3), (2, 6), (3, 11), (200, 3015)].forEach { (n, value) in
			let answer = problem.compute(target: n)
			XCTAssertEqual(answer?.value, value)
		}
	}
}

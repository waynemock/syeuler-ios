//
//  Problem14Tests.swift
//  SyEulerTests
//
//  Created by Wayne Mock on 1/16/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import XCTest
@testable import SyEuler

class Problem14Tests: XCTestCase {

	let problem = Problem14Op(inputs: []) { results in }

	func testTargetOutOfRange() throws {
		let answer = problem.compute(target: 0)
		XCTAssertEqual(answer?.value, nil)
		XCTAssertEqual(answer?.details, nil)
		XCTAssertEqual(answer?.error, "Must be > 0")
	}

	func test1million() throws {
		let answer = problem.compute(target: 1000000)
		XCTAssertEqual(answer?.value, 837799)
	}

	func testAnswers() throws {
		[(10, 9), (100, 97), (1000, 871), (10000, 6171), (100000, 77031)].forEach { (n, value) in
			let answer = problem.compute(target: n)
			XCTAssertEqual(answer?.value, value)
		}
	}
}

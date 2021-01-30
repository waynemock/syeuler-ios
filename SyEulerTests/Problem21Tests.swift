//
//  Problem21Tests.swift
//  SyEulerTests
//
//  Created by Wayne Mock on 1/30/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import XCTest
@testable import SyEuler

class Problem21Tests: XCTestCase {

	let problem = Problem21Op(inputs: []) { results in }

	func test10000() throws {
		let answer = problem.compute(target: 10_000)
		XCTAssertEqual(answer?.value, 31626)
	}

	func testAnswers() throws {
		[(100, 0), (1_000, 504)].forEach { (n, value) in
			let answer = problem.compute(target: n)
			XCTAssertEqual(answer?.value, value)
		}
	}
}

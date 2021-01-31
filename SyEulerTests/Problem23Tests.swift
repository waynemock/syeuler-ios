//
//  Problem23Tests.swift
//  SyEulerTests
//
//  Created by Wayne Mock on 1/31/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import XCTest
@testable import SyEuler

class Problem23Tests: XCTestCase {

	let problem = Problem23Op(inputs: []) { results in }

	func test() throws {
		let answer = problem.compute(target: 30000)
		XCTAssertEqual(answer?.value, 4179871)
	}

	func testAnswers() throws {
		[(12, 78), (100, 2766), (1000, 240492)].forEach { (n, value) in
			let answer = problem.compute(target: n)
			XCTAssertEqual(answer?.value, value)
		}
	}
}

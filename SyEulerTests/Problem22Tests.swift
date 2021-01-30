//
//  Problem22Tests.swift
//  SyEulerTests
//
//  Created by Wayne Mock on 1/30/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import XCTest
@testable import SyEuler

class Problem22Tests: XCTestCase {

	let problem = Problem22Op(inputs: []) { results in }

	func test0() throws {
		let answer = problem.compute(target: 0)
		XCTAssertEqual(answer?.value, 871198282)
	}

	func testAnswers() throws {
		[(1, 49), (938, 49714)].forEach { (n, value) in
			let answer = problem.compute(target: n)
			XCTAssertEqual(answer?.value, value)
		}
	}
}

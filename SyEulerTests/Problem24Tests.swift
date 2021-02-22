//
//  Problem24Tests.swift
//  SyEulerTests
//
//  Created by Wayne Mock on 2/22/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import XCTest
@testable import SyEuler

class Problem24Tests: XCTestCase {

	let problem = Problem24Op(inputs: []) { results in }

	func testTargetOutOfRange() throws {
		[0, -1].forEach { n in
			let answer = problem.compute(target: n)
			XCTAssertEqual(answer?.value, nil)
			XCTAssertEqual(answer?.details, nil)
			XCTAssertEqual(answer?.error, "Must be > 0")
		}
	}


	func test() throws {
		let answer = problem.compute(target: 1_000_000)
		XCTAssertEqual(answer?.value, "2783915460")
	}

	func testAnswers() throws {
		[(1, "0123456789"), (2, "0123456798"), (1000, "0124658793")].forEach { (n, value) in
			let answer = problem.compute(target: n)
			XCTAssertEqual(answer?.value, value)
		}
	}
}

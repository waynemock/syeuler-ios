//
//  Problem4Tests.swift
//  SyEulerTests
//
//  Created by Wayne Mock on 1/1/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import XCTest
@testable import SyEuler

class Problem4Tests: XCTestCase {

	let problem = Problem4Op(inputs: []) { results in }

	func testTarget0() throws {
		let answer = problem.compute(target: 0)
		XCTAssertEqual(answer?.value, nil)
		XCTAssertEqual(answer?.details, nil)
		XCTAssertEqual(answer?.error, "Must be > 0")
	}

	func testTarget1() throws {
		let answer = problem.compute(target: 1)
		XCTAssertEqual(answer?.value, 9)
		XCTAssertEqual(answer?.details, "Product of 9 * 1")
		XCTAssertEqual(answer?.error, nil)
	}

	func testTarget2() throws {
		let answer = problem.compute(target: 2)
		XCTAssertEqual(answer?.value, 9009)
		XCTAssertEqual(answer?.details, "Product of 99 * 91")
		XCTAssertEqual(answer?.error, nil)
	}

	func testTarget3() throws {
		let answer = problem.compute(target: 3)
		XCTAssertEqual(answer?.value, 906609)
		XCTAssertEqual(answer?.details, "Product of 993 * 913")
		XCTAssertEqual(answer?.error, nil)
	}
}

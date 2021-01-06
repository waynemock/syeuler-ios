//
//  Problem9Tests.swift
//  SyEulerTests
//
//  Created by Wayne Mock on 1/6/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import XCTest
@testable import SyEuler

/**
Test triplets from:
https://en.wikipedia.org/wiki/Pythagorean_triple
*/

class Problem9Tests: XCTestCase {

	let problem = Problem9Op(inputs: []) { results in }

	func testTarget0() throws {
		let answer = problem.compute(target: 0)
		XCTAssertEqual(answer?.value, nil)
		XCTAssertEqual(answer?.details, nil)
		XCTAssertEqual(answer?.error, "No solution found")
	}

	func testTarget12() throws {
		let answer = problem.compute(target: 12)
		XCTAssertEqual(answer?.value, 60)
		XCTAssertEqual(answer?.details, "Pythagorean triplet: (3, 4, 5)")
	}

	func testTarget30() throws {
		let answer = problem.compute(target: 30)
		XCTAssertEqual(answer?.value, 780)
		XCTAssertEqual(answer?.details, "Pythagorean triplet: (5, 12, 13)")
	}

	func testTarget234() throws {
		let answer = problem.compute(target: 234)
		XCTAssertEqual(answer?.value, 453960)
		XCTAssertEqual(answer?.details, "Pythagorean triplet: (65, 72, 97)")
	}

	func testTarget1000() throws {
		let answer = problem.compute(target: 1000)
		XCTAssertEqual(answer?.value, 31875000)
		XCTAssertEqual(answer?.details, "Pythagorean triplet: (200, 375, 425)")
	}
}

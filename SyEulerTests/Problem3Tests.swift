//
//  Problem3Tests.swift
//  SyEulerTests
//
//  Created by Wayne Mock on 12/31/20.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import XCTest
@testable import SyEuler

/// Test data generated from this Wikipedia article:
/// https://en.wikipedia.org/wiki/Table_of_prime_factors

class Problem3Tests: XCTestCase {

	let problem = Problem3Op(inputs: []) { results in }

	func testTarget0() throws {
		let answer = problem.compute(target: 0)
		XCTAssertEqual(answer?.value, nil)
		XCTAssertEqual(answer?.details, nil)
		XCTAssertEqual(answer?.error, "No prime factors for 0")
	}

	func testTarget1() throws {
		let answer = problem.compute(target: 1)
		XCTAssertEqual(answer?.value, nil)
		XCTAssertEqual(answer?.details, nil)
		XCTAssertEqual(answer?.error, "No prime factors for 1")
	}

	func testTargetMinus1() throws {
		let answer = problem.compute(target: -1)
		XCTAssertEqual(answer?.value, nil)
		XCTAssertEqual(answer?.details, nil)
		XCTAssertEqual(answer?.error, "No prime factors for -1")
	}

	func testTarget2() throws {
		let answer = problem.compute(target: 2)
		XCTAssertEqual(answer?.value, nil)
		XCTAssertEqual(answer?.details, "2 is prime")
		XCTAssertEqual(answer?.error, nil)
	}

	func testTarget3() throws {
		let answer = problem.compute(target: 3)
		XCTAssertEqual(answer?.value, nil)
		XCTAssertEqual(answer?.details, "3 is prime")
		XCTAssertEqual(answer?.error, nil)
	}

	func testTarget4() throws {
		let answer = problem.compute(target: 4)
		XCTAssertEqual(answer?.value, 2)
		XCTAssertEqual(answer?.details, "Prime factors: [2, 2]")
		XCTAssertEqual(answer?.error, nil)
	}

	func testTarget5() throws {
		let answer = problem.compute(target: 5)
		XCTAssertEqual(answer?.value, nil)
		XCTAssertEqual(answer?.details, "5 is prime")
		XCTAssertEqual(answer?.error, nil)
	}

	func testTarget6() throws {
		let answer = problem.compute(target: 6)
		XCTAssertEqual(answer?.value, 3)
		XCTAssertEqual(answer?.details, "Prime factors: [2, 3]")
		XCTAssertEqual(answer?.error, nil)
	}

	func testTarget7() throws {
		let answer = problem.compute(target: 7)
		XCTAssertEqual(answer?.value, nil)
		XCTAssertEqual(answer?.details, "7 is prime")
	}

	func testTarget8() throws {
		let answer = problem.compute(target: 8)
		XCTAssertEqual(answer?.value, 2)
		XCTAssertEqual(answer?.details, "Prime factors: [2, 2, 2]")
		XCTAssertEqual(answer?.error, nil)
	}

	func testTarget9() throws {
		let answer = problem.compute(target: 9)
		XCTAssertEqual(answer?.value, 3)
		XCTAssertEqual(answer?.details, "Prime factors: [3, 3]")
		XCTAssertEqual(answer?.error, nil)
	}

	func testTarget11() throws {
		let answer = problem.compute(target: 11)
		XCTAssertEqual(answer?.value, nil)
		XCTAssertEqual(answer?.details, "11 is prime")
		XCTAssertEqual(answer?.error, nil)
	}

	func testTarget92() throws {
		let answer = problem.compute(target: 92)
		XCTAssertEqual(answer?.value, 23)
		XCTAssertEqual(answer?.details, "Prime factors: [2, 2, 23]")
		XCTAssertEqual(answer?.error, nil)
	}

	func testTarget930() throws {
		let answer = problem.compute(target: 930)
		XCTAssertEqual(answer?.value, 31)
		XCTAssertEqual(answer?.details, "Prime factors: [2, 3, 5, 31]")
		XCTAssertEqual(answer?.error, nil)
	}

	func testTarget966() throws {
		let answer = problem.compute(target: 966)
		XCTAssertEqual(answer?.value, 23)
		XCTAssertEqual(answer?.details, "Prime factors: [2, 3, 7, 23]")
		XCTAssertEqual(answer?.error, nil)
	}

	func testTarget997() throws {
		let answer = problem.compute(target: 977)
		XCTAssertEqual(answer?.value, nil)
		XCTAssertEqual(answer?.details, "977 is prime")
		XCTAssertEqual(answer?.error, nil)
	}

	func testTarget998() throws {
		let answer = problem.compute(target: 998)
		XCTAssertEqual(answer?.value, 499)
		XCTAssertEqual(answer?.details, "Prime factors: [2, 499]")
		XCTAssertEqual(answer?.error, nil)
	}

	func testTarget999() throws {
		let answer = problem.compute(target: 999)
		XCTAssertEqual(answer?.value, 37)
		XCTAssertEqual(answer?.details, "Prime factors: [3, 3, 3, 37]")
		XCTAssertEqual(answer?.error, nil)
	}

	func testTargetMinus999() throws {
		let answer = problem.compute(target: -999)
		XCTAssertEqual(answer?.value, 37)
		XCTAssertEqual(answer?.details, "Prime factors: [3, 3, 3, 37]")
		XCTAssertEqual(answer?.error, nil)
	}
}

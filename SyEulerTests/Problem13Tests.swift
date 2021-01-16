//
//  Problem13Tests.swift
//  SyEulerTests
//
//  Created by Wayne Mock on 1/16/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import XCTest
@testable import SyEuler

class Problem13Tests: XCTestCase {

	let problem = Problem13Op(inputs: []) { results in }

	func testTargetOutOfRange() throws {
		[0, 16].forEach { n in
			let answer = problem.compute(target: n)
			XCTAssertEqual(answer?.value, nil)
			XCTAssertEqual(answer?.details, nil)
			XCTAssertEqual(answer?.error, "Must be > 0 and <= 15")
		}
	}

	func test10() throws {
		let answer = problem.compute(target: 10)
		XCTAssertEqual(answer?.value, 5537376230)
	}

	func testAll() throws {
		var sum = "553737623039087"
		while !sum.isEmpty {
			let answer = problem.compute(target: sum.count)
			XCTAssertEqual(answer?.value, Int(sum))
			sum = String(sum.prefix(sum.count - 1))
		}
	}
}

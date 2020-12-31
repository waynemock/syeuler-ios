//
//  Problem3Op.swift
//  SyEuler
//
//  Created by Wayne Mock on 12/31/20.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import Foundation

class Problem3Op: ProblemIntOp {
	/**
	Returns the largest prime factor of `target`.

	Uses Wheel Factorization to determine all the factors of `target`.

	See this Wikipedia article for more details:
	https://en.m.wikipedia.org/wiki/Wheel_factorization

	- Parameter target: The targe number.
	- Returns: The largest prime factor, or `nil` if cancelled before completion.
	*/
	override func compute(target: Int) -> Int? {
		guard target != 0 else { return 0 }
		var n = abs(target)
		var factors = [Int]()
		[2, 3, 5].forEach { factor in
			while n % factor == 0 {
				factors.append(factor)
				n /= factor
			}
		}
		var k = 7, i = 0
		while k ^ 2 <= n {
			if n % k == 0 {
				factors.append(k)
				n /= k
			} else {
				k += inc[i]
				i = (i + 1) % inc.count
			}
			if isCancelled {
				return nil
			}
			report(progress: (Double(k) / Double(n)))
		}
		if n > 1 {
			factors.append(n)
		}

		/// Test the results by multiplying all the factors together, which should equal the `target`.
		let result = factors.reduce(1, { $0 * $1 })
		if result != target {
			LogError(self, "result(\(result) != target(\(target)")
		}

		return factors.last ?? n
	}

	/// Increments for finding the next prime.
	let inc = [4, 2, 4, 2, 4, 6, 2, 6]
}
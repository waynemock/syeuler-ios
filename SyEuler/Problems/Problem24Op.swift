//
//  Problem24Op.swift
//  SyEuler
//
//  Created by Wayne Mock on 1/31/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import Foundation

class Problem24Op: ProblemStringOp {
	/**
	Computes  the Nth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9, where N is `target`.

	- Parameter target: The target number to consider.
	- Returns: The permutation, or `nil` if cancelled before completion.
	*/
	override func compute(target: Int) -> StringAnswer? {
		guard target > 0 else { return StringAnswer(error: "Must be > 0") }
		var count = 1
		let digits = "0123456789"
		var permutation = Array(digits)
		let last = permutation.count - 1
		while count < target {
			let first = findFirst(permutation)
			if first == -1 {
				break
			}
			let second = findSecond(target: permutation, first: permutation[first], low: first + 1, high: last)
			permutation.swapAt(first, second)
			reverse(&permutation, first + 1, last)
			count += 1
			report(progress: count, target)
			if isCancelled {
				 return nil
			}
		}
		return StringAnswer(value: String(permutation))
	}

	func findFirst(_ target: [String.Element]) -> Int {
		for index in (0..<target.count-1).reversed() {
			if target[index] < target[index+1] {
				return index
			}
		}
		return -1
	}

	func findSecond(target: [String.Element], first: String.Element, low: Int, high: Int) -> Int {
		guard low < high else { return high }
		var ceilIndex = low
		for index in (low+1)...high {
			if target[index] > first && target[index] < target[ceilIndex] {
				ceilIndex = index
			}
		}
		return ceilIndex
	}

	func reverse(_ target: inout [String.Element], _ low: Int, _ high: Int) {
		guard low < high else { return }
		var l = max(low, 0)
		var h = min(high, target.count - 1)
		while l < h {
			target.swapAt(l, h)
			l += 1
			h -= 1
		}
	}

}

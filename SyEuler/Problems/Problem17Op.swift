//
//  Problem17Op.swift
//  SyEuler
//
//  Created by Wayne Mock on 1/18/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import Foundation

class Problem17Op: ProblemIntOp {
	/**
	Returns the number of letters of all the numbers from 1 to `target` inclusive when written out in words.

	- Parameter target: The target number to consider.
	- Returns: The number of letters, or `nil` if cancelled before completion.
	*/
	override func compute(target: Int) -> IntAnswer? {
		guard target > 0 else { return IntAnswer(error: "Must be > 0") }
		var count = 0
		for number in 1...target {
			if let asWords = formatter.string(from: NSNumber(value: number)) {
				count += asWords.filter({ $0.isLetter }).count
				if asWords.contains(" hundred ") {
					/// Count the `and` required by the problem description. Even using the en_GB locale did not add the `and`
					count += 3
				}
				if isCancelled {
					return nil
				}
				report(progress: Double(number) / Double(target))
			}
		}
		return IntAnswer(value: count)
	}

	var formatter: NumberFormatter = {
		let formatter = NumberFormatter()
		formatter.numberStyle = .spellOut
		formatter.locale = Locale(identifier: "en_GB")
		return formatter
	}()
}

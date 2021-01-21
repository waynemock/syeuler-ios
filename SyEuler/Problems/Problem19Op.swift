//
//  Problem19Op.swift
//  SyEuler
//
//  Created by Wayne Mock on 1/20/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import Foundation

class Problem19Op: ProblemIntOp {
	/**
	Returns the number of Sundays that fell on the first of the month between Jan 1, 1901 to Dec, 31 `target`.

	- Parameter target: The target number to consider.
	- Returns: The number of Sundays, or `nil` if cancelled before completion.
	*/
	override func compute(target: Int) -> IntAnswer? {
		guard target > 1900 && target <= 2000 else { return IntAnswer(error: "Must be > 1900 and <= 2000") }
		var sundays = 0
		var days = 1
		for year in 1900...target {
			for month in 0..<daysInMonth.count {
				/// If day is a multiple of 7 it's a Sunday since 1/7/1900 is the first Sunday, and the 7th day in our series.
				if year > 1900 && days % 7 == 0 {
					sundays += 1
				}
				days += daysInMonth[month]
				if month == 1 && isLeapYear(year) {
					days += 1
				}
			}
		}
		return IntAnswer(value: sundays)
	}

	/**
	Returns `true` if `year` is a leap year.

	A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.

	- Parameter year: The year to consider.
	- Returns: `true` if `year` is a leap year, otherwise `false`.
	*/
	func isLeapYear(_ year: Int) -> Bool {
		return !(year % 4 != 0 || (year % 100 == 0 && year % 400 != 0))
	}

	let daysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
}

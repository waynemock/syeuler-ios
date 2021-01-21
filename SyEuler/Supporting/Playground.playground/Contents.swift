// Here's my solution in Swift. Just copy it into a Playground and press play.
// Finished in 3 ms on my iPhone 12 Pro

import Foundation

/**
Returns the number of Sundays that fell on the first of the month between Jan 1, 1901 to Dec, 31 `target`.

- Parameter target: The target number to consider.
- Returns: The number of Sundays, or `nil` if out of range.
*/
func compute(target: Int) -> Int? {
	guard target > 1900 && target <= 2000 else { return nil }
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
	return sundays
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

compute(target: 2000)

// Here's my solution in Swift. Just copy it into a Playground and press play.
// Finished in 1.2 seconds on my iPhone 12 Pro

import Foundation

/**
Returns the sum of all the positive integers which cannot be written as the sum of two abundant numbers..

Every integer greater than 20161 can be written as the sum of two abundant numbers.
I know the problem says 28123, but my research shows it's actually 20161.
https://en.wikipedia.org/wiki/Abundant_number

- Parameter target: The target number to consider.
- Returns: The sum, or `nil` or if out of range.
*/
func compute(target: Int) -> Int? {
	guard target > 0 else { return nil }
	let max = min(target, 20161)
	abundantNumbers = []
	/// Find all abundant numbers in the range
	for number in 1...max {
		if sumOfProperDivisors(of: number) > number {
			abundantNumbers.insert(number)
		}
	}
	/// Compute the sum by considering all numbers up to our `max`.
	/// Even some abundant numbers are not sums of abundant numbers.
	var sum = 0
	for nonAbundant in 1...max {
		if !isSumOfAbundantNumbers(nonAbundant) {
			sum += nonAbundant
		}
	}
	return sum
}

/**
Determines if `target` is the sum of abundant numbers.

- Parameter target: The number to consider.
- Returns: `true` if `target` is the sum of abundant numbers.
*/
func isSumOfAbundantNumbers(_ target: Int) -> Bool {
	for abundantNumber in abundantNumbers {
		if abundantNumbers.contains(target - abundantNumber) {
			return true
		}
	}
	return false
}

/**
Returns the sum of all the proper divisors of `target`.

- Parameter target: The number to consider.
- Returns: The sum
*/
func sumOfProperDivisors(of target: Int) -> Int {
	let t = abs(target)
	guard t > 0 else { return 0 }
	let max = sqrt(t)
	guard max > 2 else { return 1 }
	var sum = 1
	for m in 2...max {
		if t % m == 0 {
			sum += m
			let n = t / m
			if m != n {
				sum += n
			}
		}
	}
	return sum
}

func sqrt(_ x: Int) -> Int {
	return Int(sqrt(Double(x)))
}

var abundantNumbers: Set<Int> = []

compute(target: 28123)

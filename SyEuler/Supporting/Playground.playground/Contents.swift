// Here's my solution in Swift. Just copy it into a Playground and press play.
// Finished in 3ms on my iPhone 12 Pro

import Foundation

/**
Returns the index of the first term in the Fibonacci sequence to contain `target` digits.

Uses a simple formula based on tBinet's Formula. The number of digits in Fib(n) is

`n * log10(phi) / log10(5) / 2`

`phi = (sqrt(5) + 1) / 2`

- Parameter target: The number of digits to compute to.
- Returns: The sum, or `nil` if cancelled before completion.
*/
func compute(target: Int) -> Int? {
	guard target > 0 else { return nil }
	var n = 0
	var numDigits = 1
	while numDigits < target {
		n += 1
		numDigits = Double.digits(ofFib: n)
	}
	return n
}

extension Double {
	static let phi = (sqrt(5.0) + 1) / 2
	static let logPhi = log10(phi)
	static let log5by2 = log10(5.0) / 2

	/**
	Computes the number of digits in the Fibonacci `Fib(n)`
	- Parameter fibN: The Fibonacci index to consider
	- Returns: The number of digits of `Fib(n)`
	*/
	static func digits(ofFib n: Int) -> Int {
		return Int((Double(n) * Double.logPhi) - Double.log5by2) + 1
	}
}

compute(target: 1_000)

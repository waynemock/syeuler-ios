// Here's my solution in Swift. Just copy it into a Playground and press play.
// Finished in 8 ms on my iPhone 12 Pro

import Foundation

/**
Returns the value of `d < target` for which `1/d` contains the longest recurring cycle in its decimal fraction part.

- Parameter target: The largest denominator to consider
- Returns: The longest recurring cycle, or `nil` if cancelled before completion.
*/
func compute(target: Int) -> Int? {
	guard target > 0 else { return nil }
	for value in (0..<target).reversed() {
		/// Assumes the answer will be a cyclic number where it's recurring cycle length is itself - 1
		if recurringCycleLength(of: value) == (value - 1) {
			return value
		}
	}
	return nil
}

/**
Computes the recurring cycle lenght of `1 / target`.

- Parameter target: The value to consider
- Returns: The length of the recurring cycle
*/
func recurringCycleLength(of target: Int) -> Int {
	var n = 10, q = 0, r = 0
	var qr = [String:Int]()
	while qr["\(q).\(r)"] == nil {
		qr["\(q).\(r)"] = n
		q = n / target
		r = n % target
		n = r * 10
	}
	return qr.count - 1
}

compute(target: 1_000)

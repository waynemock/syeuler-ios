// Here's my solution in Swift. Just copy it into a Playground and press play.
// Finished in 1 second on my iPhone 12 Pro

import Foundation

/**
Returns the starting number, under `target`, produces the longest chain?

The following iterative sequence is defined for the set of positive integers:

n → n/2 (n is even)
n → 3n + 1 (n is odd)


- Parameter target: The target number to consider.
- Returns: The starting number", or `nil` if  out of range.
*/
func compute(target: Int) -> Int? {
	guard target > 0 else { return nil }
	var longest = 0
	var value = 0
	for m in 1..<target {
		var n = m
		var steps = 1
		while n > 1 {
			if n % 2 == 0 {
				n /= 2
			} else {
				n = 3 * n + 1
			}
			steps += 1
		}
		if steps > longest {
			longest = steps
			value = m
		}
	}
	return value
}

compute(target: 1000000)

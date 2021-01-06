// Here's my solution in Swift. Just copy it into a Playground and press play.
// Finished in 7 seconds on my iPhone 12 Pro

import Foundation

/**
Returns the product of `abc` where `a < b < c` and  `a + b + c == target`.

- Parameter target: The target number to consider.
- Returns: The product, or `nil` if no solution found.
*/
func compute(target: Int) -> Int? {
	guard target >= 12 else { return nil }
	let max = target / 2
	var triplet: (Int, Int, Int)?
	for c in 5..<max {
		for b in 4..<c {
			for a in 3..<b {
				if a + b + c == target && a*a + b*b == c*c {
					triplet = (a, b, c)
					break
				}
			}
		}
	}
	guard let answer = triplet else { return nil }
	return answer.0 * answer.1 * answer.2
}

compute(target: 12)
compute(target: 1000)

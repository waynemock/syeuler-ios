// Here's my solution in Swift. Just copy it into a Playground and press play.
// Finished in 0.6 ms on my iPhone 12 Pro

import Foundation

/**
Returns  the difference between the sum of the squares of the natural numbers up to `target` and the square of the sum.

- Parameter target: The target number to consider.
- Returns: The difference.
*/
func compute(target: Int) -> Int {
	var sumOfSquares = 0
	var sum = 0
	for x in 1...target {
		// NOTE: this can overflow with larger `target` values, so be careful.
		sumOfSquares += x * x
		sum += x
	}
	return (sum * sum) - sumOfSquares
}

compute(target: 10)
compute(target: 100)

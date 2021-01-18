// Here's my solution in Swift. Just copy it into a Playground and press play.
// Finished in 3 ms on my iPhone 12 Pro

import Foundation

/**
Returns the number lattice path's found in a `target` X `target` grid.

Create's a Pascal's triangle to compute the result:
https://en.wikipedia.org/wiki/Pascal%27s_triangle

- Parameter target: The target number to consider.
- Returns: The number of paths, or `nil` if out of range.
*/
func compute(target: Int) -> Int? {
	guard target > 0 else { return nil }
	/// Create's a Pascal's triangle with double the rows as the grid.
	var rows = [[1]]
	for n in 1..<(2 * target + 1) {
		let previousRow = rows[n-1]
		var nextRow = [1]
		for i in 0..<(previousRow.count-1) {
			let c = previousRow[i] + previousRow[i+1]
			nextRow.append(c)
		}
		nextRow.append(1)
		rows.append(nextRow)
	}
	/// The result is the value in the middle of the last row of the Pascal's triangle.
	return rows.last![rows.last!.count/2]
}

compute(target: 20)

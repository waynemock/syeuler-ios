// Here's my solution in Swift. Just copy it into a Playground and press play.
// Finished in 14 ms on my iPhone 12 Pro

import Foundation

/**
Returns the maximum total from top to a depth of `target` of a triangle of numbers.

- Parameter target: The target number to consider.
- Returns: The sum, or `nil` if out of range.
*/
func compute(target: Int) -> Int? {
	guard target > 0 && target <= triangle.count else { return nil }
	Node.depth = target
	return computeMax()
}

/**
A recrusive function to compute the maximum sum all the paths thru a binary tree of numbers.

- Parameter sum: The current sum, with a default value of 0
- Parameter child: A child `Node` to consider. Default is the root node.
*/
func computeMax(sum: Int = 0, from child: Node? = Node(row: 0, index: 0)) -> Int {
	guard let child = child else { return sum }
	guard !child.isLeaf else { return sum + value(of: child) }
	let left = computeMax(sum: sum, from: child.left)
	let right = computeMax(sum: sum, from: child.right)
	return sum + value(of: child) + max(left, right)
}

func value(of node: Node) -> Int {
	return triangle[node.row][node.index]
}

/**
A simple structure to map the triangle into nodes of a binary tree.
*/
struct Node {
	let row: Int
	let index: Int
	var isLeaf: Bool {
		return row + 1 >= Node.depth
	}
	var left: Node? {
		guard !isLeaf else { return nil }
		return Node(row: row+1, index: index)
	}
	var right: Node? {
		guard !isLeaf else { return nil }
		return Node(row: row+1, index: index+1)
	}
	/// How deep we want to descend into the triangle.
	static var depth = 0
}

let triangle = [
	[75],
	[95, 64],
	[17, 47, 82],
	[18, 35, 87, 10],
	[20, 04, 82, 47, 65],
	[19, 01, 23, 75, 03, 34],
	[88, 02, 77, 73, 07, 63, 67],
	[99, 65, 04, 28, 06, 16, 70, 92],
	[41, 41, 26, 56, 83, 40, 80, 70, 33],
	[41, 48, 72, 33, 47, 32, 37, 16, 94, 29],
	[53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14],
	[70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57],
	[91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48],
	[63, 66, 04, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31],
	[04, 62, 98, 27, 23, 09, 70, 98, 73, 93, 38, 53, 60, 04, 23],
]

compute(target: 15)

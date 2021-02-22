// Here's my solution in Swift. Just copy it into a Playground and press play.
// Finished in 1.2 seconds on my iPhone 12 Pro

import Foundation

/**
Computes  the Nth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9, where N is `target`.

- Parameter target: The target number to consider.
- Returns: The permutation, or `nil` if cancelled before completion.
*/
func compute(target: Int) -> String? {
	guard target > 0 else { return nil }
	var count = 1
	let digits = "0123456789"
	var permutation = Array(digits)
	let last = permutation.count - 1
	while count < target {
		let first = findFirst(permutation)
		if first == -1 {
			break
		}
		let second = findSecond(target: permutation, first: permutation[first], start: first + 1, end: last)
		permutation.swapAt(first, second)
		reverse(&permutation, first + 1, last)
		count += 1
	}
	return String(permutation)
}

/**
Returns the index of the first digit to swap, where the first digit is the first that's smaller than one to it's right.
- Parameter target: The array to consider.
- Returns: The index fo the first digit.
*/
func findFirst(_ target: [String.Element]) -> Int {
	for index in (0..<target.count-1).reversed() {
		if target[index] < target[index+1] {
			return index
		}
	}
	return -1
}

/**
Returns the index of the second digit to swap, where the second digit is the smallest digit to the right of `start` that
is greater than the `first` digit.
- Parameter target: The array to consider.
- Parameter first: The first digit to consider.
- Parameter start: The start of the subsection.
- Parameter end: The end of the subsection.
- Returns: The index fo the second digit.
*/
func findSecond(target: [String.Element], first: String.Element, start: Int, end: Int) -> Int {
	guard start < end else { return end }
	var ceilIndex = start
	for index in (start+1)...end {
		if target[index] > first && target[index] < target[ceilIndex] {
			ceilIndex = index
		}
	}
	return ceilIndex
}

/**
Reverses a subsection of an array of String.Element. Reverses the entire array by default.
- Parameter target: The array to consider.
- Parameter start: The start of the subsection.
- Parameter end: The end of the subsection.
*/
func reverse(_ target: inout [String.Element], _ start: Int = 0, _ end: Int = Int.max) {
	guard start < end else { return }
	var sstart = max(start, 0)
	var eend = min(end, target.count - 1)
	while sstart < eend {
		target.swapAt(sstart, eend)
		sstart += 1
		eend -= 1
	}
}

compute(target: 1_000_000)

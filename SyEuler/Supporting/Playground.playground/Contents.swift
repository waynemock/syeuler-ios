// Here's my solution in Swift. Just copy it into a Playground and press play.
// Finished in 3 ms on my iPhone 12 Pro

import Foundation

/**
Returns the sum of the digits of the number 2^`target`

I used the BigInt protoype found on the Swift.org GitHub repo:
https://github.com/apple/swift/blob/main/test/Prototypes/BigInt.swift
No sense in reinventing the wheel...

- Parameter target: The target number to consider.
- Returns: The sum, or `nil` if cancelled before completion.
*/
func compute(target: Int) -> Int? {
	guard target > 0 else { return nil }
	let value = BigInt(1) << target
	let digits = value.toString()
	let sum = digits.reduce(into: 0) { sum, letter in
		sum += Int(String(letter)) ?? 0
	}
	return sum
}

compute(target: 1000)

// Here's my solution in Swift. Just copy it into a Playground and press play.
// Finished in 458 ms on my iPhone 12 Pro

import Foundation

/**
Find the sum of the digits in the number`target!`.

I used the BigInt protoype found on the Swift.org GitHub repo:
https://github.com/apple/swift/blob/main/test/Prototypes/BigInt.swift
No sense in reinventing the wheel...


- Parameter target: The target number to consider.
- Returns: The sum, or `nil` if out of range..
*/
func compute(target: Int) -> Int? {
	guard target > 0 && target <= 200 else { return nil }
	let digits = factorial(BigInt(target)).toString()
	let sum = digits.reduce(into: 0) { sum, letter in
		sum += Int(String(letter)) ?? 0
	}
	return sum
}

/**
Returns `target!`, or the factorial of `target`.

- Parameter target: The number to consider.
- Returns: The fatorial
*/
func factorial(_ target: BigInt) -> BigInt {
	return (1...target).reduce(1, *)
}

compute(target: 100)

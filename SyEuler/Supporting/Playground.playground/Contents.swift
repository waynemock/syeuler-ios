// Here's my solution in Swift. Just copy it into a Playground and press play.
// Finished in 10 seconds on my iPhone 12 Pro

import Foundation

/**
Returns the sum of all primes below `target`.

Uses simplified Wheel Factorization to determine the `target`th prime.

Reference:
https://en.m.wikipedia.org/wiki/Wheel_factorization

- Parameter target: The Nth number to generate.
- Returns: The sum, or `nil` if cancelled before completion.
*/
func compute(target: Int) -> Int? {
	guard target > 0 else { return nil }
	/// Initial set of primes to kick off the wheel factorization
	var primes = [2,3,5]
	var k = 7, i = 0
	while k < target {
		if isPrime(k, primes) {
			primes.append(k)
		}
		k += inc[i]
		i = (i + 1) % inc.count
	}
	return primes.reduce(0, { $0 + $1 })
}

/**
Returns `true` if `value` is prime.

Uses the existing `primes` array to determine if `value` is prime.
If it is not a multiple of any existing prime, then it is prime.

- Parameter value: The value to test for prime.
- Parameter primes: The current array of primes.
- Returns: `true` if `value` is prime, otherwise `false`.
*/
func isPrime(_ value: Int, _ primes: [Int]) -> Bool {
	let sqRoot = Int(sqrt(Double(value)))
	guard value % sqRoot != 0 else { return false }
	for index in 0..<primes.count {
		let prime = primes[index]
		if value % prime == 0 {
			/// Not prime if `value` is a multiple of a prime
			return false
		}
		if sqRoot < prime {
			/// Stop looking if the primes are larger than the square root
			break
		}
	}
	return true
}

/// Increments for finding the next prime.
let inc = [4, 2, 4, 2, 4, 6, 2, 6]

compute(target: 10)
compute(target: 2000000)

// Here's my solution in Swift. Just copy it into a Playground and press play.
// Finished in 950 ms on my iPhone 12 Pro

import Foundation

/**
Returns the product of the coefficients, `a` and `b`, for the quadratic expression `n*n + an + b`,
that produces the maximum number of primes for consecutive values of `n`, starting with `n = 0`.

- Parameter target: The largest `b` to consider
- Returns: The product of a and b, or `nil` if no solution.
*/
func compute(target: Int) -> Int? {
	guard target > 1 else { return nil }
	var most = Most()
	/// Seems the largest sequences are made when `b` is prime, so don't consider the negative values
	for b in 2...target {
		for a in -target..<target {
			let count = primes(a, b)
			if count > most.count {
				most.count = count
				most.a = a
				most.b = b
			}
		}
	}
	return most.a * most.b
}

/**
Counts the number of primes genereated by numbers starting with 0.

- Parameter a: The `a` value to plug in
- Parameter b: The `b` value to plug in
- Returns: The number of primes
*/
func primes(_ a: Int, _ b: Int) -> Int {
	guard isPrime(b) else { return 0 }
	var primes = 0
	for n in 0...abs(b) {
		/// Simplified n*n + n*a + b
		let p = n * (n + a) + b
		if isPrime(p) {
			primes += 1
		} else {
			break
		}
	}
	return primes
}

/**
Returns `true` if `value` is prime using the 6k+-1 optimization.

- Parameter value: The value to test for prime.
- Returns: `true` if `value` is prime, otherwise `false`.
*/
func isPrime(_ value: Int) -> Bool {
	guard value > 3 else { return value > 1 }
	guard value % 2 != 0 && value % 3 != 0 else { return false }
	var index = 5
	while index * index <= value {
		if value % index == 0 || value % (index + 1) == 0 {
			return false
		}
		index += 6
	}
	return true
}

func details(_ most: Most) -> String {
	return "\(most.count) primes\nFrom a = \(most.a) and b = \(most.b)"
}


struct Most {
	var count = 0
	var a = 0
	var b = 0
}

compute(target: 1_000)

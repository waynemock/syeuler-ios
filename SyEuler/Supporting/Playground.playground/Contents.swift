// Here's my solution in Swift. Just copy it into a Playground and press play.
// Finished in 120 ms on my iPhone 12 Pro

import Foundation

/**
Returns the value of the first triangle number to have over `target` divisors?

- Parameter target: The number of divisors to consider.
- Returns: The number, or `nil` if `target` is out of range.
*/
func compute(target: Int) -> Int? {
	guard target > 0 else { return nil }
	var count = 0
	var index = 1
	var nextTriangleNumber = 1
	while count <= target {
		index += 1
		nextTriangleNumber += index
		count = numberOfDivisors(of: nextTriangleNumber)
	}
	return nextTriangleNumber
}

/**
Returns the number of divisors of `target`.


Reference:
https://mathschallenge.net/index.php?section=faq&ref=number/number_of_divisors

- Parameter target: The number to consider.
- Returns:The number of divisors.`
*/
func numberOfDivisors(of target: Int) -> Int {
	guard let factors = primeFactors(of: target) else { return 0 }
	var count = 1
	/// d(n) = (a+1)(b+1)(c+1)... where a, b, c... are powers of the primes
	factors.forEach { (prime, power) in
		count *= power + 1
	}
	return count
}

/**
Returns the  prime factors and related power of `target`.

Uses Wheel Factorization to determine all the factors of `target`.

See this Wikipedia article for more details:
https://en.m.wikipedia.org/wiki/Wheel_factorization

- Parameter target: The target number.
- Returns: A dictionary of  prime factors and their powers, or `nil` if cancelled before completion.
*/
func primeFactors(of target: Int) -> [Int:Int]? {
	var factors = [Int]()
	var n = target
	[2, 3, 5].forEach { factor in
		while n % factor == 0 {
			factors.append(factor)
			n /= factor
		}
	}
	var k = 7, i = 0
	while k * k <= n {
		if n % k == 0 {
			factors.append(k)
			n /= k
		} else {
			k += inc[i]
			i = (i + 1) % inc.count
		}
	}
	/// n == 1 when `target` was a prime number
	if n > 1 {
		// n is our largest prime factor
		factors.append(n)
	}
	var primes = [Int:Int]()
	factors.forEach { factor in
		let power = primes[factor] ?? 0
		primes[factor] = power + 1
	}
	return primes
}

/// Increments for finding the next prime.
let inc = [4, 2, 4, 2, 4, 6, 2, 6]

compute(target: 500)

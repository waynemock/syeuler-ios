// Here's my solution in Swift. Just copy it into a Playground and press play.

import Foundation

/**
Returns the smallest multiple made from the sequence of 1...`target`.

This implementation relies on using prime factors to generate the smallest multiple,
aka least common multiple.

The least common multiple is the product of multiplying the highest power of each
prime factor together of all the numbers in the sequence.

Reference:
https://en.m.wikipedia.org/wiki/Least_common_multiple

- Parameter target: The target number to consider.
- Returns: The smallest multiple
*/
func compute(target: Int) -> Int {
	var primes = [Int:Int]() // keep track of each prime and its largest power
	for x in 1...target {
		primeFactors(of: x).forEach({ (prime, power) in
			// Have we seen this prime?
			if let currentPower = primes[prime] {
				// Yes, then store it if its power is greater than the current
				if currentPower < power {
					primes[prime] = power
				}
			} else {
				// No, then just store the power
				primes[prime] = power
			}
		})
	}
	// Compute the answer by raising each prime to the related power
	var answer = 1
	primes.forEach { (prime, count) in
		answer *= pow(prime, count)
	}
	return answer
}

/**
Returns the  prime factors and related power of `target`.

Uses Wheel Factorization to determine all the factors of `target`.

See this Wikipedia article for more details:
https://en.m.wikipedia.org/wiki/Wheel_factorization

- Parameter target: The target number.
- Returns: A dictionary of  prime factors and their powers, or `nil` if cancelled before completion.
*/
func primeFactors(of target: Int) -> [Int:Int] {
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

func pow(_ lhs: Int, _ rhs: Int) -> Int {
	return Int(pow(Double(lhs), Double(rhs)))
}

compute(target: 10)
compute(target: 20)

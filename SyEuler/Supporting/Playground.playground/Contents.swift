// Here's my solution in Swift. Just copy it into a Playground and press play.
// Finished in 286 ms on my iPhone 12 Pro

import Foundation

/**
Returns the sum of all the amicable numbers under `target`.

- Parameter target: The target number to consider.
- Returns: The sum
*/
func compute(target: Int) -> Int {
	// We know the first pair is (220, 284) so start looking there
	guard target >= 220 else { return 0 }
	var amicable: Set<Int> = []
	for a in 220...target {
		if !amicable.contains(a) {
			let b = sumOfProperDivisors(of: a)
			if a != b {
				let c = sumOfProperDivisors(of: b)
				if a == c {
					amicable.insert(a)
					amicable.insert(b)
				}
			}
		}
	}
	return amicable.reduce(0, +)
}

func sumOfProperDivisors(of target: Int) -> Int {
	let t = abs(target)
	guard t > 0 else { return 0 }
	let max = sqrt(t)
	guard max > 2 else { return 1 }
	var sum = 1
	for m in 2...max {
		if t % m == 0 {
			sum += m
			let n = t / m
			if m != n {
				sum += n
			}
		}
	}
	return sum
}

func sqrt(_ x: Int) -> Int {
	return Int(sqrt(Double(x)))
}

compute(target: 10_000)

// Here's my solution in Swift. Just copy it into a Playground and press play.
// Finished in 24 ms on my iPhone 12 Pro

import Foundation

/**
Returns the number of letters of all the numbers from 1 to `target` inclusive when written out in words.

- Parameter target: The target number to consider.
- Returns: The number of letters, or `nil` if overflow occured.
*/
func compute(target: Int) -> Int? {
	guard target > 0 else { return nil }
	var count = 0
	for number in 1...target {
		if let asWords = formatter.string(from: NSNumber(value: number)) {
			count += asWords.filter({ $0.isLetter }).count
			if asWords.contains(" hundred ") {
				/// Count the `and` required by the problem description. Even using the en_GB locale did not add the `and`
				count += 3
			}
		}
	}
	return count
}

var formatter: NumberFormatter = {
	let formatter = NumberFormatter()
	formatter.numberStyle = .spellOut
	formatter.locale = Locale(identifier: "en_GB")
	return formatter
}()

compute(target: 1000)

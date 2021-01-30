// Here's my solution in Swift. Just copy it into a Playground and press play.
// Finished in 60 ms on my iPhone 12 Pro

import Foundation

/**
Returns the total of all the name scores in the file.

- Parameter target: The target number to consider.
- Returns: The total
*/
func compute(target: Int) -> Int {
	let names = getSortedNames()
	guard !names.isEmpty else { return 0 }
	if target <= 0 || target > names.count {
		var sum = 0
		for index in 1...names.count {
			sum += computeNameScore(of: index, with: names)
		}
		return sum
	} else {
		return computeNameScore(of: target, with: names)
	}
}

/**
Computes the name score of the `nth` name found in `names`

The name score is the sume of the character values, 1 - 26, times it's position in the `names` array.

- Parameter nth: The nth name to consider, so 1 is the 1st name, with an index of 0.
- Parameter names: An array of names to consider.
*/
func computeNameScore(of nth: Int, with names: [String]) -> Int {
	var sum = 0
	names[nth-1].forEach { character in
		let charScore = Int(character.asciiValue!) - asciiValueOfA + 1
		// Assuming English name made from the letters A-Z
		if (1...26).contains(charScore) {
			sum += charScore
		}
	}
	return sum * nth
}

/**
Returns the names found in `Problem22Names.txt` as an array of strings.

Copy the `p022_names.txt` file into the `Resources` direcotry of the playground.
*/
func getSortedNames() -> [String] {
	do {
		guard let url = Bundle.main.url(forResource: "p022_names", withExtension: "txt") else { return [] }
		let data = try String(contentsOf: url, encoding: String.Encoding.utf8)
		/// Remove any non-ascii non-letter characters.
		/// There might be whitespace or other symbols that do not count.
		return data.filter({($0.isASCII && $0.isLetter) || $0 == ","})
			.uppercased()
			.components(separatedBy: ",")
			.sorted()
	} catch {
		return []
	}
}

/// We assume the names are uppercased already, by `getSortedNames`.
let asciiValueOfA = Int(Character("A").asciiValue!)

compute(target: 938)
compute(target: 0)

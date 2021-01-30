//
//  Problem22Op.swift
//  SyEuler
//
//  Created by Wayne Mock on 1/30/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import Foundation

class Problem22Op: ProblemIntOp {
	/**
	Returns the total of all the name scores in the file.

	- Parameter target: The target number to consider.
	- Returns: The total, or `nil` if cancelled before completion.
	*/
	override func compute(target: Int) -> IntAnswer? {
		let names = getSortedNames()
		if target <= 0 || target > names.count {
			var sum = 0
			for index in 1...names.count {
				sum += computeNameScore(of: index, with: names).score
			}
			return IntAnswer(value: sum, details: "Sum of \(names.count) names")
		} else {
			let score = computeNameScore(of: target, with: names)
			return IntAnswer(value: score.score, details: score.details)
		}
	}

	/**
	Computes the name score of the `nth` name found in `names`

	The name score is the sume of the character values, 1 - 26, times it's position in the `names` array.

	- Parameter nth: The nth name to consider, so 1 is the 1st name, with an index of 0.
	- Parameter names: An array of names to consider.
	*/
	func computeNameScore(of nth: Int, with names: [String]) -> NameScore {
		let name = names[nth-1]
		var sum = 0
		var charScores = [Int]()
		name.forEach { character in
			let charScore = Int(character.asciiValue!) - asciiValueOfA + 1
			// Assuming English name made from the letters A-Z
			if (1...26).contains(charScore) {
				charScores.append(charScore)
				sum += charScore
			}
		}
		return NameScore(nth: nth, name: name, asciiSum: sum, score: sum * nth, charScores: charScores)
	}

	/**
	Returns the names found in `Problem22Names.txt` as an array of strings.
	*/
	func getSortedNames() -> [String] {
		do {
			guard let url = Bundle.main.url(forResource: "Problem22Names", withExtension: "txt") else { return [] }
			let data = try String(contentsOf: url, encoding: String.Encoding.utf8)
			// Remove any non-ascii non-letter characters. There might be whitespace or other symbols that do not count.
			return data.filter({($0.isASCII && $0.isLetter) || $0 == ","}).uppercased().components(separatedBy: ",").sorted()
		} catch let error as NSError {
			LogError(self, "error=\(error)")
			return []
		}
	}

	/// We assume the names are uppercased already, by `getSortedNames`.
	let asciiValueOfA = Int(Character("A").asciiValue!)

	/**
	A simple structure to manage the results of compuing a name score.
	*/
	struct NameScore {
		let nth: Int
		let name: String
		let asciiSum: Int
		let score: Int
		let charScores: [Int]

		var details: String {
			return "Name: \(name)\nASCII sum: \(asciiSum)\nCharacter scores:\n\(charScores)"
		}
	}
}

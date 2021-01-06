//
//  Problem8Op.swift
//  SyEuler
//
//  Created by Wayne Mock on 1/4/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import Foundation

class Problem8Op: ProblemIntOp {
	/**
	Returns the largest product in a series of `target` digits.
	
	- Parameter target: The target number to consider.
	- Returns: The product, or `nil` if cancelled before completion.
	*/
	override func compute(target: Int) -> IntAnswer? {
		guard target > 0 else { return IntAnswer(error: "Must be > 0")}
		guard target <= sequence.count else { return IntAnswer(error: "Must be <= \(sequence.count)")}

		var answer = 0
		var start = 0
		for x in 0..<(sequence.count - target) {
			var product = 1
			for index in x..<(x + target) {
				guard let result = product *? sequence[index] else { return IntAnswer(error: "Overflowed Max.int at index \(x)") }
				product = result
			}
			if product > answer {
				answer = product
				start = x
			}
		}
		let details = Array(sequence[start..<(start + target)]).compactMap({ String($0) }).joined(separator: " * ")
		return IntAnswer(value: answer, details: "Start index: \(start)\n\(details)")
	}

	/// Convert the sequence into an array of Ints
	let sequence = [
		"73167176531330624919225119674426574742355349194934",
		"96983520312774506326239578318016984801869478851843",
		"85861560789112949495459501737958331952853208805511",
		"12540698747158523863050715693290963295227443043557",
		"66896648950445244523161731856403098711121722383113",
		"62229893423380308135336276614282806444486645238749",
		"30358907296290491560440772390713810515859307960866",
		"70172427121883998797908792274921901699720888093776",
		"65727333001053367881220235421809751254540594752243",
		"52584907711670556013604839586446706324415722155397",
		"53697817977846174064955149290862569321978468622482",
		"83972241375657056057490261407972968652414535100474",
		"82166370484403199890008895243450658541227588666881",
		"16427171479924442928230863465674813919123162824586",
		"17866458359124566529476545682848912883142607690042",
		"24219022671055626321111109370544217506941658960408",
		"07198403850962455444362981230987879927244284909188",
		"84580156166097919133875499200524063689912560717606",
		"05886116467109405077541002256983155200055935729725",
		"71636269561882670428252483600823257530420752963450",
	].joined().compactMap { Int(String($0)) }
}

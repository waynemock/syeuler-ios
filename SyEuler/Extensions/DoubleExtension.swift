//
//  Extensions.swift
//  SyEmber
//
//  Created by Wayne Mock on 6/14/17.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import UIKit

extension Double {

	/// Represents the number of digits in the whole number of the value
	var numberOfIntegerDigits: Int {
		return "\(Int(self))".count
	}

	/// Rounds the value to zero decimal places.
	var roundTo0: String {
		return round(to: 0)
	}

	/// Rounds the value to one decimal place.
	var roundTo1: String {
		return round(to: 1)
	}

	/// Rounds the value to two decimal places.
	var roundTo2: String {
		return round(to: 2)
	}

	/// Rounds the value to three decimal places.
	var roundTo3: String {
		return round(to: 3)
	}

	/// Rounds the value to four decimal places.
	var roundTo4: String {
		return round(to: 4)
	}

	/// Rounds the value to five decimal places.
	var roundTo5: String {
		return round(to: 5)
	}

	/// Rounds the value to the specified decimal place.
	func round(to decimalPlace:Int) -> String {
		let formatter = NumberFormatter()
		formatter.roundingMode = .halfUp
		formatter.minimumFractionDigits = 0
		formatter.maximumFractionDigits = decimalPlace
		formatter.minimumIntegerDigits = 1
		formatter.numberStyle = NumberFormatter.Style.decimal
		formatter.usesGroupingSeparator = true
		let retVal = formatter.string(from: NSNumber(value: self)) ?? "\(self)"
		return retVal
	}

	var asFraction: String {
		let whole = Int(self)
		let fraction = self - Double(whole)
		let wholeString = whole == 0 ? "" : "\(whole)"

		if fraction < (1/16) {
			return "\(wholeString)"
		} else if fraction < (3/16) {
			return "\(wholeString)⅛"
		} else if fraction < (5/16) {
			return "\(wholeString)¼"
		} else if fraction < (7/16) {
			return "\(wholeString)⅜"
		} else if fraction < (9/16) {
			return "\(wholeString)½"
		} else if fraction < (11/16) {
			return "\(wholeString)⅝"
		} else if fraction < (13/16) {
			return "\(wholeString)¾"
		} else if fraction < (15/16) {
			return "\(wholeString)⅞"
		} else {
			return "\(whole+1)"
		}
	}
}


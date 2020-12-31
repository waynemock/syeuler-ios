//
//  UIColorExtension.swift
//  SyWord
//
//  Created by Wayne Mock on 1/28/19.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import UIKit
import SwiftUI

extension Color {
	static var main: Color { return Color("Main") }
}

extension UIColor {

	static var main: UIColor { return UIColor(named: "Main") ?? UIColor.green }

	/// Inverts the color
	var inverted: UIColor {
		var r = CGFloat(0)
		var g = CGFloat(0)
		var b = CGFloat(0)
		var a = CGFloat(0)
		if getRed(&r, green: &g, blue: &b, alpha: &a) {
			return UIColor(red: 1-r, green: 1-g, blue: 1-b, alpha: a)
		}
		return .black
	}

	/// Create a 30% lighter color
	var lighter: UIColor {
		return lighter(by: 30)
	}

	/// Create a lighter color
	func lighter(by percentage: Float) -> UIColor {
		return brighter(by: abs(percentage))
	}

	/// Create a 30% darker color
	var darker: UIColor {
		return darker(by: 50)
	}

	/// Create a darker color
	func darker(by percentage: Float) -> UIColor {
		return brighter(by: -abs(percentage))
	}

	/// Create a 30% brighter color
	var brighter: UIColor {
		return brighter(by: 30)
	}

	/// Try to increase or decrease the brightness
	func brighter(by percentage: Float) -> UIColor {
		guard percentage != 0 else { return self }

		var hue: CGFloat = 0
		var saturation: CGFloat = 0
		var brightness: CGFloat = 0
		var alpha: CGFloat = 0

		if getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) {
			let absPercentage = CGFloat(abs(percentage) > 100 ? 100 : abs(percentage)) / 100
			let factor = percentage > 0 ? (1 + absPercentage) : (1 - absPercentage)
			return UIColor(hue: hue, saturation: saturation, brightness: brightness * factor, alpha: alpha)
		} else {
			return self
		}
	}
}


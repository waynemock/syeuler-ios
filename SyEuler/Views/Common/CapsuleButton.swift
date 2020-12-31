//
//  CapsuleButton.swift
//  SyWord
//
//  Created by Wayne Mock on 11/24/20.
//

import SwiftUI

typealias CapsuleButtonAction = () -> Void

struct CapsuleButton: View {

	var label: String
	var font = Font.body
	var borderColor = Color.main
	var borderWidth = CGFloat(2)

	var action: CapsuleButtonAction?

	var body: some View {
		Button(action: { action?() }) {
			Text(label)
				.font(font)
				.bold()
				.padding(.vertical, 4)
				.padding(.horizontal, 10)
				.background(Capsule().stroke(borderColor, lineWidth: borderWidth))
		}
	}
}


struct CapsuleButton_Previews: PreviewProvider {
    static var previews: some View {
		VStack {
			CapsuleButton(label: "Button 1")
		}
    }
}

//
//  GoButton.swift
//  SyEuler
//
//  Created by Wayne Mock on 12/29/20.
//

import SwiftUI

typealias GoButtonAction = () -> Void

struct GoButton: View {
	var action: GoButtonAction?

	var body: some View {
		Button(action: { action?() }) {
			HStack {
				Text("GO")
					.foregroundColor(.main)
					.bold()
					.padding(8)
			}
			.background(Color.white)
			.cornerRadius(20)
		}
	}
}

struct GoButton_Previews: PreviewProvider {
    static var previews: some View {
        GoButton()
    }
}

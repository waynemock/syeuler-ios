//
//  GoButton.swift
//  SyEuler
//
//  Created by Wayne Mock on 12/29/20.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import SwiftUI

typealias GoButtonAction = () -> Void

struct GoButton: View {

	enum GoState {
		case done, running, stopping

		var isDone: Bool { return self == .done}
		var isRunning: Bool { return self == .running}
		var isStopping: Bool { return self == .stopping }

		var label: String {
			switch self {
			case .done: return "GO"
			case .running: return "Stop"
			case .stopping: return "Stopping"
			}
		}
	}

	var state: GoState
	var action: GoButtonAction?

	var body: some View {
		Button(action: { action?() }) {
			HStack {
				Text(state.label)
					.font(.title3)
					.foregroundColor(.main)
					.bold()
					.padding(8)
				if state.isRunning {
					ProgressView()
						.progressViewStyle(CircularProgressViewStyle(tint: .main))
						.padding(.trailing, 8)
				}
			}
			.background(Color.white)
			.cornerRadius(20)
		}
	}
}

struct GoButton_Previews: PreviewProvider {
	static var previews: some View {
		GoButton(state: .running)
	}
}

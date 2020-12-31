//
//  ContentView.swift
//  SyEuler
//
//  Created by Wayne Mock on 12/29/20.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import SwiftUI

struct ProblemList: View {
	let problems: [Problem];

	@State private var activeSheet: Sheet?

	enum Sheet: Identifiable {
		case info

		var id: Int { return hashValue }
		var isInfoActive: Bool { return self == .info }
	}

    var body: some View {
		NavigationView {
			List {
				ForEach(problems) { problem in
					NavigationLink(destination: ProblemDetail(problem: problem)) {
						ProblemRow(problem: problem)
					}
				}
			}
			.toolbar {
				ToolbarItem(placement: .navigationBarLeading) {
					Text("SyEuler")
						.font(.title3)
						.bold()
						.foregroundColor(.main)
				}
				ToolbarItem(placement: .navigationBarTrailing) {
					Button(action: { activeSheet = .info  }) {
						Label("General information", systemImage: "info.circle")
					}
				}
			}
			.navigationTitle("Problems")
		}
		.sheet(item: $activeSheet) { item in
			switch item {
			case .info:
				GeneralInfo()
			}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		ProblemList(problems: [
			Problem2(),
			Problem1(),
		])
    }
}

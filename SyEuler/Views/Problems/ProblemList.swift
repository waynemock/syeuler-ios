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
	@State private var nextProblem = 0

	enum Sheet: Identifiable {
		case info
		case link(String)
		var id: String { return "\(self)" }
	}

	struct Link {
		static let all = Sheet.link("https://projecteuler.net/archives")
		static let next = "https://www.projecteuler.net/problem="
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
					Button(action: { activeSheet = .info  }) {
						Label("General information", systemImage: "info.circle")
					}
				}
				ToolbarItem(placement: .navigationBarTrailing) {
					Button(action: { activeSheet = Sheet.link("\(Link.next)\(nextProblem)") }) {
						Label("Next problem", systemImage: "function")
					}
				}
				ToolbarItem(placement: .navigationBarTrailing) {
					Button(action: { activeSheet = Link.all  }) {
						Label("All problems", systemImage: "sum")
					}
				}
			}
			.navigationTitle("Problems")
		}
		.sheet(item: $activeSheet) { item in
			switch item {
			case .info:
				GeneralInfo()
			case let .link(link):
				if let url = URL(string: link) {
					SafariView(url: url)
				}
			}
		}
		.onAppear {
			nextProblem = problems.count + 1
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		ProblemList(problems: [
			Problem3(),
			Problem2(),
			Problem1(),
		])
    }
}

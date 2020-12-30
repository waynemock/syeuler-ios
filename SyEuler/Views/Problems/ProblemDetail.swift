//
//  ProblemDetail.swift
//  SyEuler
//
//  Created by Wayne Mock on 12/29/20.
//

import SwiftUI

struct ProblemDetail: View {
	let problem: Problem

	@State private var activeSheet: Sheet?

	enum Sheet: Identifiable {
		case euler, github
		var id: Int { return hashValue }
	}

	var body: some View {
		ScrollView {
			VStack(alignment: .leading, spacing: 8.0) {
				ProblemTitle(problem: problem)
				Text(problem.summary)
			}
			.foregroundColor(.white)
			.padding()
			.background(Color.main)

			VStack(alignment: .leading, spacing: 8.0) {
				ProblemStartedOn(problem: problem)
				ProblemCompletedOn(problem: problem)
			}
			.padding(.horizontal)

			VStack(alignment: .leading, spacing: 8.0) {
				HStack {
					Button(action: { activeSheet = .euler }) {
						Text("Project Euler")
							.underline()
					}
					Spacer()
					Button(action: { activeSheet = .github }) {
						Text("Source code")
							.underline()
					}
				}
				.foregroundColor(.white)
			}
			.padding(.horizontal)
			.padding(.vertical, 8)
			.background(Color.main)
		}
		.sheet(item: $activeSheet) { item in
			switch item {
			case .euler: SafariView(url: problem.url)
			case .github: SafariView(url: problem.sourceUrl)
			}
		}
		.navigationBarTitle(Text(""), displayMode: .inline)
    }
}

struct ProblemDetail_Previews: PreviewProvider {
    static var previews: some View {
		ProblemDetail(problem: Problem1())
			.preferredColorScheme(.dark)
		ProblemDetail(problem: Problem2())
    }
}

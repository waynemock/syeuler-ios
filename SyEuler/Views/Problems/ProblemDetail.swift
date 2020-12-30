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
	@State private var amount = ""
	@State private var answer: Int?
	@State private var elapsed = TimeInterval(0)

	enum Sheet: Identifiable {
		case euler, github
		var id: Int { return hashValue }
	}

	func go() {
		answer = nil
		if let amount = Int(amount) {
			let start = Date()
			answer = problem.compute(target: amount)
			elapsed = start.distance(to: Date()) * 1000
		}
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

			VStack(alignment: .leading, spacing: 8.0) {
				Text("Try it out")
					.font(.title3)
					.padding(.top)
					.padding(.horizontal)
				VStack(alignment: .leading) {
					HStack {
						TextField("Enter an amount", text: $amount, onCommit: go)
							.padding(.trailing, 8)
							.textFieldStyle(RoundedBorderTextFieldStyle())
							.disableAutocorrection(true)
							.keyboardType(.numberPad)
						Spacer()
						GoButton(action: go)
					}
					.padding()
				}
				.background(Color.main)
				if let answer = answer {
					VStack(alignment: .leading) {
						Text("Answer: \(answer)")
						Text("\(elapsed.roundTo2) ms")
							.font(.footnote)
					}
					.padding(.horizontal)
				}
			}

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

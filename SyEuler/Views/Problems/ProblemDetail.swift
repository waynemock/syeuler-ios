//
//  ProblemDetail.swift
//  SyEuler
//
//  Created by Wayne Mock on 12/29/20.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import SwiftUI

struct ProblemDetail: View {
	let problem: Problem

	@State private var state = GoButton.GoState.done
	@State private var activeSheet: SafariSheet?
	@State private var input = ""
	@State private var answer: String?
	@State private var elapsed: TimeInterval?
	@State private var percentComplete: Double?
	@State private var placeholder = ""

	private let queue = ProblemQueue()

	struct Link {
		static let euler = SafariSheet.link("https://projecteuler.net")
		static let github = SafariSheet.link("https://www.github.com/waynemock/syeuler-ios")
		static let syzygy = SafariSheet.link("https://www.syzygysoftwerks.com")
	}

	func go() {
		switch state {
		case .done:
			if queue.operationCount == 0 {
				answer = nil
				elapsed = nil
				percentComplete = nil
				state = .running
				queue.start(op: problem.getOp(inputs: [input]) { result in
					answer = result.answer
					percentComplete = result.precentComplete
					elapsed = result.elapsed
					if result.isDone {
						state = .done
					}
				})
			}
		case .running:
			state = .stopping
			queue.stop()
		case .stopping:
			break
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
					CapsuleButton(label: "Project Euler", borderColor: .white, action: { activeSheet = .link(problem.url) })
					CapsuleButton(label: "Source code", borderColor: .white, action: { activeSheet = .link(problem.sourceUrl) })
					Spacer()
				}
				.foregroundColor(.white)
			}
			.padding(.horizontal)
			.padding(.vertical, 8)
			.background(Color.main)

			VStack(alignment: .leading, spacing: 8.0) {
				VStack(alignment: .leading) {
					VStack(alignment: .leading, spacing: 6) {
						Text("Try it out")
							.bold()
							.foregroundColor(.white)
						HStack {
							TextField(placeholder, text: $input, onCommit: go)
								.textFieldStyle(RoundedBorderTextFieldStyle())
								.disableAutocorrection(true)
								.keyboardType(.numberPad)
								.disabled(!state.isDone)
							if input.count > 0 {
								Spacer()
								GoButton(state: state, action: go)
							}
						}
					}
					.padding(.horizontal)
					.padding(.top, 8)
					.padding(.bottom)
				}
				.background(Color.main)
				VStack(alignment: .leading) {
					if let answer = answer {
						Text(answer)
					}
					if let percentComplete = percentComplete {
						ProgressView(value: percentComplete)
					}
					if let elapsed = elapsed {
						if elapsed < 1 {
							Text("\((elapsed * 1000).roundTo1) ms")
								.font(.footnote)
						} else {
							Text("\(elapsed.roundTo0) seconds")
								.font(.footnote)
						}
					}
				}
				.padding(.horizontal)
			}

			if problem.references.count > 0 {
				VStack(alignment: .leading, spacing: 16.0) {
					VStack {
						HStack {
							Text("References")
								.bold()
								.foregroundColor(.white)
							Spacer()
						}
						.padding(.horizontal)
					}
					.padding(.vertical, 8)
					.background(Color.main)
					VStack(alignment: .leading, spacing: 12.0) {
						ForEach(problem.references) { reference in
							CapsuleButton(label: reference.label, action: { activeSheet = .link(reference.link) })
						}
					}
					.padding(.horizontal)
				}
			}

		}
		.sheet(item: $activeSheet) { item in
			switch item {
			case let .link(link):
				if let url = URL(string: link) {
					SafariView(url: url)
				}
			}
		}
		.navigationBarTitle(Text(""), displayMode: .inline)
		.onAppear {
			input = problem.defaultInput
			placeholder = problem.inputPlaceholder
		}
		.onDisappear {
			queue.stop()
		}
    }
}

struct ProblemDetail_Previews: PreviewProvider {
    static var previews: some View {
		ProblemDetail(problem: Problem3())
			.preferredColorScheme(.dark)
		ProblemDetail(problem: Problem2())
    }
}

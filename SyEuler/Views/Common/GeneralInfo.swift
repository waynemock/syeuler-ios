//
//  GeneralInfo.swift
//  SyEuler
//
//  Created by Wayne Mock on 12/29/20.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import SwiftUI

struct GeneralInfo: View {
	@Environment(\.presentationMode) var presentation

	@State private var activeSheet: SafariSheet?

	struct Link {
		static let euler = SafariSheet.link("https://projecteuler.net")
		static let github = SafariSheet.link("https://www.github.com/waynemock/syeuler-ios")
		static let syzygy = SafariSheet.link("https://www.syzygysoftwerks.com")
	}

    var body: some View {
		ScrollView {
			VStack {
				VStack {
					HStack {
						Button(action: close) {
							Text("Done").font(.title3).bold()
						}
						Spacer()
						Text("Version \(Bundle.main.appVersion)").italic()
					}
					.padding()
				}
				.foregroundColor(.white)
				.background(Color.main)
				.ignoresSafeArea()
				VStack(alignment: .leading, spacing: 8.0) {
					Text("Hi!").font(.title)
					Text("SyEuler provides access to my solutions to the Project Euler problems. All my solutions are developed in Swift.")
					Text("With the app, you can see the problem descriptions on the Project Euler site, view my source code on GitHub, and try out my algorithms.")
					Text("The computations run in a background thread and can be stopped if you get impatient waiting for the result.")
					Text("Long running computations show a progress bar and elapsed time, so you have something to watch while you wait. Most problems run in a few milliseconds.")
					Text("More information can be found on the Project Euler site, my GitHub repo, or my website.")
					Text("")
					VStack(alignment: .leading, spacing: 16.0) {
						CapsuleButton(label: "projecteuler.net", action: { activeSheet = Link.euler })
						CapsuleButton(label: "github.com", action: { activeSheet = Link.github })
						CapsuleButton(label: "syzygysoftwerks.com", action: { activeSheet = Link.syzygy })
					}
				}
				.padding()
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
    }

	private func close() {
		presentation.wrappedValue.dismiss()
	}
}

struct GeneralInfo_Previews: PreviewProvider {
    static var previews: some View {
        GeneralInfo()
    }
}

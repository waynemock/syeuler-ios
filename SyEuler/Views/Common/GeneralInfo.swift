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

    var body: some View {
		ScrollView {
			VStack {
				HStack {
					Button(action: close) {
						Text("Done").font(.title3).bold()
					}
					Spacer()
					Text("Version \(Bundle.main.appVersion)").italic().foregroundColor(.main)
				}
				.padding(.vertical, 10)
				VStack(alignment: .leading, spacing: 8.0) {
					Text("Hi!").font(.title)
					Text("SyEuler provides access to my solutions to the Project Euler problems. All my solutions are developed in Swift.")
					Text("With the app, you can see the problem descriptions on the Project Euler site, view my source code on GitHub, and try out my algorithms.")
					Text("The computations run in a background thread and can be stopped if you get impatient waiting for the result.")
					Text("Long running computations show a progress bar and elapsed time, so you have something to watch while you wait. Most problems run in a few milliseconds.")
					Text("More information can be found on the Project Euler site, my GitHub repo, or my website.")
					Text("")
					VStack(alignment: .leading, spacing: 16.0) {
						CapsuleButton(label: "projecteuler.net", action: { activeSheet = .url(URL(string: "https://www.projecteuler.net")) })
						CapsuleButton(label: "github.com", action: { activeSheet = .url(URL(string: "https://www.github.com/waynemock/syeuler-ios")) })
						CapsuleButton(label: "syzygysoftwerks.com", action: { activeSheet = .url(URL(string: "https://www.syzygysoftwerks.com")) })
					}
				}
			}
			.padding()
		}
		.sheet(item: $activeSheet) { item in
			switch item {
			case let .url(url):
				if let url = url {
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

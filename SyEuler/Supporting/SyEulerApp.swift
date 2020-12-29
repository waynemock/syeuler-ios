//
//  SyEulerApp.swift
//  SyEuler
//
//  Created by Wayne Mock on 12/29/20.
//

import SwiftUI

@main
struct SyEulerApp: App {
	let problems = [
		Problem2(),
		Problem1(),
	]

	init() {
		initAppearance()
	}

	private func initAppearance() {
		let navBar = UINavigationBar.appearance()
		navBar.largeTitleTextAttributes = [.foregroundColor: UIColor.main]
		navBar.titleTextAttributes = [.foregroundColor: UIColor.main]
	}

	var body: some Scene {
        WindowGroup {
            ProblemList(problems: problems)
        }
    }
}

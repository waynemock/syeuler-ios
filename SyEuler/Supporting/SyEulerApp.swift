//
//  SyEulerApp.swift
//  SyEuler
//
//  Created by Wayne Mock on 12/29/20.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import SwiftUI

@main
struct SyEulerApp: App {
	let problems = [
		Problem4(),
		Problem3(),
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

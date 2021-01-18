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

	let problems = [
		Problem16(),
		Problem15(),
		Problem14(),
		Problem13(),
		Problem12(),
		Problem11(),
		Problem10(),
		Problem9(),
		Problem8(),
		Problem7(),
		Problem6(),
		Problem5(),
		Problem4(),
		Problem3(),
		Problem2(),
		Problem1(),
	]
}

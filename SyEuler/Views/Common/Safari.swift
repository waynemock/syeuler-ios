//
//  Safari.swift
//  SyEuler
//
//  Created by Wayne Mock on 12/29/20.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import SafariServices
import SwiftUI

enum SafariSheet: Identifiable {
	case euler, github, syzygy
	var id: Int { return hashValue }
}

struct SafariView: UIViewControllerRepresentable {

	let url: URL

	func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
		let safari = SFSafariViewController(url: url)
		safari.preferredControlTintColor = UIColor.main
		return safari
	}

	func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {

	}

}

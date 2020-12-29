//
//  Safari.swift
//  SyEuler
//
//  Created by Wayne Mock on 12/29/20.
//

import SafariServices
import SwiftUI

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

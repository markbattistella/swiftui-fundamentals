//
//  SafariView.swift
//  SwiftUI-AppleFrameworks
//
//  Created by Mark Battistella on 13/10/21.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
	
	let url: URL
	
	func makeUIViewController(context: Context) -> SFSafariViewController {
		SFSafariViewController(url: url)
	}
	
	func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {}
}

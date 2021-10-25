//
//  LoadingView.swift
//  SwiftUI-Appetisers
//
//  Created by Mark Battistella on 25/10/21.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
	
	func makeUIView(context: Context) -> UIActivityIndicatorView {
		let activityIndicatorView = UIActivityIndicatorView(style: .large)
		activityIndicatorView.color = UIColor.brandPrimary
		activityIndicatorView.startAnimating()
		return activityIndicatorView
	}
	
	func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}
}


struct LoadingView: View {
	
	var body: some View {
		ZStack {
			Color(.systemBackground)
				.edgesIgnoringSafeArea(.all)
			
			ActivityIndicator()
		}
	}
}

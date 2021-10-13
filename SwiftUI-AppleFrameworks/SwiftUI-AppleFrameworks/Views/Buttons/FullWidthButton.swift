//
//  FullWidthButton.swift
//  SwiftUI-AppleFrameworks
//
//  Created by Mark Battistella on 13/10/21.
//

import SwiftUI

struct FullWidthButton: View {
	let title: String
	let backgroundColour: Color
	
	var body: some View {
		Text(title)
			.frame(maxWidth: .infinity, minHeight: 50)
			.background(backgroundColour)
			.foregroundColor(.white)
			.font(.headline)
			.cornerRadius(12)
			.padding(.horizontal)
	}
}

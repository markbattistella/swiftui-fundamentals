//
//  CustomModifiers.swift
//  SwiftUI-Appetisers
//
//  Created by Mark Battistella on 28/10/21.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {
	func body(content: Content) -> some View {
		content
			.buttonStyle(.borderedProminent)
			.tint(.brandPrimary)
			.controlSize(.large)
	}
}

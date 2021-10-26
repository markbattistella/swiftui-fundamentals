//
//  XDismissButton.swift
//  SwiftUI-Appetisers
//
//  Created by Mark Battistella on 26/10/21.
//

import SwiftUI

struct XDismissButton: View {
    var body: some View {
		Circle()
			.frame(width: 30, height: 30)
			.foregroundColor(.white)
			.opacity(0.6)
		Image(systemName: "xmark")
			.imageScale(.small)
			.frame(width: 44, height: 44)
		.foregroundColor(.black)
	}
}

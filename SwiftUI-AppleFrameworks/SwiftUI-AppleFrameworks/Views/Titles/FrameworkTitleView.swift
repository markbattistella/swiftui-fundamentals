//
//  FrameworkTitleView.swift
//  SwiftUI-AppleFrameworks
//
//  Created by Mark Battistella on 13/10/21.
//

import SwiftUI

struct FrameworkTitleView: View {
	let framework: Framework
	
	var body: some View {
		VStack {
			Image(framework.imageName)
				.resizable()
				.frame(width: 90, height: 90)
			Text(framework.name)
				.font(.title)
				.bold()
				.scaledToFit()
				.minimumScaleFactor(0.6)
		}
		.padding(10)
	}
}

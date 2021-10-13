//
//  FrameworkDetailView.swift
//  SwiftUI-AppleFrameworks
//
//  Created by Mark Battistella on 12/10/21.
//

import SwiftUI

struct FrameworkDetailView: View {
	
	let framework: Framework
	@Binding var isShowingDetailView: Bool
	@State private var isShowingSafariView = false

	var body: some View {

		VStack {
			
			XDismissButton()
			
			Spacer()
			
			FrameworkTitleView(framework: framework)
			
			Text(framework.description)
				.font(.body)
				.padding(30)
			
			Spacer()
			
			Button {
				isShowingSafariView = true
			} label: {
				FullWidthButton(title: "Learn more", backgroundColour: .blue)
			}
		}
		
		.fullScreenCover(isPresented: $isShowingSafariView) {
			SafariView(url: URL(string: framework.urlString)!)
				.ignoresSafeArea()
		}
	}
	
	
	fileprivate func XDismissButton() -> some View {
		return HStack {
			Spacer()
			Button {
				isShowingDetailView = false
			} label: {
				Image(systemName: "xmark")
					.foregroundColor(Color(.label))
					.frame(width: 44, height: 44)
			}
		}
		.padding(.horizontal)
	}

}

struct FrameworkDetailView_Previews: PreviewProvider {
    static var previews: some View {
		FrameworkDetailView(framework: MockData.sampleFramework, isShowingDetailView: .constant(false))
    }
}

//
//  EmptyState.swift
//  SwiftUI-Appetisers
//
//  Created by Mark Battistella on 28/10/21.
//

import SwiftUI

struct EmptyState: View {
	
	let imageName: String
	let message: String
	
    var body: some View {
		
		ZStack {
			Color(.systemBackground)
				.ignoresSafeArea()
			
			VStack {
				
				Image(imageName)
					.resizable()
					.scaledToFit()
					.frame(height: 150)
				
				Text(message)
					.font(.title3)
					.fontWeight(.semibold)
					.multilineTextAlignment(.center)
					.foregroundColor(.secondary)
					.padding()
			}
		}
    }
}

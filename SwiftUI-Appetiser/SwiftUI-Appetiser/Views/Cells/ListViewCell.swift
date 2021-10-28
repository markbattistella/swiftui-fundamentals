//
//  ListViewCell.swift
//  SwiftUI-Appetisers
//
//  Created by Mark Battistella on 25/10/21.
//

import SwiftUI

struct AppertiserListCell: View {
	
	let appertiser: Appertiser
	
    var body: some View {

		HStack {
			
			AsyncImage(url: URL(string: appertiser.imageURL)) { image in
				image
					.resizable()
					.aspectRatio(contentMode: .fit)
					.frame(width: 120, height: 90)
					.cornerRadius(8)
				
			} placeholder: {
				Image("food-placeholder")
					.resizable()
					.aspectRatio(contentMode: .fit)
					.frame(width: 120, height: 90)
					.cornerRadius(8)
			}

			
			VStack(alignment: .leading, spacing: 5) {
				Text(appertiser.name)
					.font(.title3)
					.fontWeight(.medium)

				Text("$\(appertiser.price, specifier: "%.2f")")
					.foregroundColor(.secondary)
					.fontWeight(.semibold)
			}
			.padding(.leading)
		}
	}
}

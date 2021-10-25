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
			
			AppertiserRemoteImage(urlString: appertiser.imageURL)
				.aspectRatio(contentMode: .fit)
				.frame(width: 120, height: 90)
				.cornerRadius(8)
			
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

struct ListViewCell_Previews: PreviewProvider {
    static var previews: some View {
		AppertiserListCell(appertiser: MockData.sampleAppetiserOne)
    }
}

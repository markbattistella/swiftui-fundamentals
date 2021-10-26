//
//  SwiftUIView.swift
//  SwiftUI-Appetisers
//
//  Created by Mark Battistella on 22/10/21.
//

import SwiftUI

struct OrderView: View {
	
	@State private var orderItems = MockData.appertisers

	var body: some View {

		NavigationView {
			VStack {
				List {
					ForEach(orderItems) { appertiser in
						AppertiserListCell(appertiser: appertiser)
					}
					.onDelete(perform: deleteItems)
				}
				.listStyle(.plain)
				
				Button {
					//
				} label: {
					APButton(title: "Place order")
				}
			}
			
			.navigationTitle("Orders")
		}
	}
	
	func deleteItems(at offsets: IndexSet) {
		orderItems.remove(atOffsets: offsets)
	}
}

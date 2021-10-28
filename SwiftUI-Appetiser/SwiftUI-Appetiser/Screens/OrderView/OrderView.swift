//
//  SwiftUIView.swift
//  SwiftUI-Appetisers
//
//  Created by Mark Battistella on 22/10/21.
//

import SwiftUI

struct OrderView: View {
	
	@EnvironmentObject var order: Order

	var body: some View {

		NavigationView {
			
			ZStack {
				VStack {
					List {
						ForEach(order.items) { appertiser in
							AppertiserListCell(appertiser: appertiser)
						}
						.onDelete(perform: order.deleteItems)
					}
					.listStyle(.plain)
					
					Button {
						//
					} label: {
						APButton(title: "$\(order.totalPrice, specifier: "%.2f") - Place order")
					}
				}

				if(order.items.isEmpty) {
					EmptyState(imageName: "empty-order", message: "You have not items. Add in an order item")
				}
				
			}
			.navigationTitle("Orders")
		}
	}
}

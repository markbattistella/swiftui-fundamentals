//
//  Order.swift
//  SwiftUI-Appetisers
//
//  Created by Mark Battistella on 28/10/21.
//

import SwiftUI

final class Order: ObservableObject {
	
	@Published var items: [Appertiser] = []
	
	var totalPrice: Double {
		items.reduce(0) {
			$0 + $1.price
		}
	}
	
	func add(_ appertiser: Appertiser) {
		items.append(appertiser)
	}
	
	
	func deleteItems(at offsets: IndexSet) {
		items.remove(atOffsets: offsets)
	}
}

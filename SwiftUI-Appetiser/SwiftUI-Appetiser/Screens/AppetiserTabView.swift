//
//  ContentView.swift
//  SwiftUI-Appetiser
//
//  Created by Mark Battistella on 13/10/21.
//

import SwiftUI

struct AppetiserTabView: View {
	
	@EnvironmentObject var order: Order
	
    var body: some View {
		
		TabView {

			ListView()
				.tabItem { Label("Home", systemImage: "house") }

			AccountView()
				.tabItem { Label("Account", systemImage: "person") }

			OrderView()
				.tabItem { Label("Order", systemImage: "bag") }
				.badge(order.items.count)
		}
	}
}

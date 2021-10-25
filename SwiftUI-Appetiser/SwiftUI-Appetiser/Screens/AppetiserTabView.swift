//
//  ContentView.swift
//  SwiftUI-Appetiser
//
//  Created by Mark Battistella on 13/10/21.
//

import SwiftUI

struct AppetiserTabView: View {
    var body: some View {
		
		TabView {

			ListView()
				.tabItem {
					Image(systemName: "house")
					Text("Home")
				}

			AccountView()
				.tabItem {
					Image(systemName: "person")
					Text("Account")
				}

			OrderView()
				.tabItem {
					Image(systemName: "bag")
					Text("Order")
				}

		}

		.accentColor(.brandPrimary)
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppetiserTabView()
    }
}

//
//  SwiftUI_AppetisersApp.swift
//  SwiftUI-Appetisers
//
//  Created by Mark Battistella on 13/10/21.
//

import SwiftUI

@main
struct SwiftUI_AppetisersApp: App {
	
	var order = Order()
	
    var body: some Scene {
        WindowGroup {
            AppetiserTabView()
				.environmentObject(order)
        }
    }
}

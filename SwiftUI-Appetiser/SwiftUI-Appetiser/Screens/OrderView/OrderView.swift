//
//  SwiftUIView.swift
//  SwiftUI-Appetisers
//
//  Created by Mark Battistella on 22/10/21.
//

import SwiftUI

struct OrderView: View {
    var body: some View {

		NavigationView {
			Text("Order View")
			
				.navigationTitle("Orders")
		}
	}
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}

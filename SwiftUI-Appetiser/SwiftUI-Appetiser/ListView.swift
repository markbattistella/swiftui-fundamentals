//
//  AppertiserListView.swift
//  SwiftUI-Appetisers
//
//  Created by Mark Battistella on 22/10/21.
//

import SwiftUI

struct ListView: View {
	
	@StateObject var viewModel = AppertiserListViewModel()
	
    var body: some View {
		
		NavigationView {

			List(viewModel.appertisers) { appertiser in
				AppertiserListCell(appertiser: appertiser)
			}
			.navigationTitle("Appertisers")
		}
		
		.onAppear {
			viewModel.getAppertisers()
		}
    }
	
	
}

struct AppertiserListView_Previews: PreviewProvider {
    static var previews: some View {
		ListView()
    }
}

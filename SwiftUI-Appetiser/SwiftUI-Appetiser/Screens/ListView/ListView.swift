//
//  AppertiserListView.swift
//  SwiftUI-Appetisers
//
//  Created by Mark Battistella on 22/10/21.
//

import SwiftUI

struct ListView: View {
	
	@StateObject var viewModel = ListViewModel()
	
    var body: some View {
		
		ZStack {
			NavigationView {

				List(viewModel.appertisers) { appertiser in
					AppertiserListCell(appertiser: appertiser)
				}
				.listStyle(.plain)
				.navigationTitle("Appertisers")
			}
			
			.onAppear {
				viewModel.getAppertisers()
			}

			
			if(viewModel.isLoading) {
				LoadingView()
			}
			
		}
		
		.alert(item: $viewModel.alertItem) { alertItem in
			Alert(
				title: alertItem.title,
				message: alertItem.message,
				dismissButton: alertItem.dismissButton
			)
		}
    }
}

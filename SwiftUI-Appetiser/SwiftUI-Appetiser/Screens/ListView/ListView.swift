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
						.onTapGesture {
							viewModel.isShowingDetail = true
							viewModel.selectedAppertiser = appertiser
						}
				}
				.listStyle(.plain)
				.navigationTitle("Appertisers")
				.disabled(viewModel.isShowingDetail)
			}
			
			.onAppear {
				viewModel.getAppertisers()
			}

			.blur(radius: viewModel.isShowingDetail ? 20 : 0)
			
			if(viewModel.isLoading) {
				LoadingView()
			}
			
			if(viewModel.isShowingDetail) {
				DetailView(
					appertiser: viewModel.selectedAppertiser,
					isShowingDetail: $viewModel.isShowingDetail
				)
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

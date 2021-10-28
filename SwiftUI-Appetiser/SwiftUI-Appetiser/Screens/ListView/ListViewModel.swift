//
//  AppertiserListViewModel.swift
//  SwiftUI-Appetisers
//
//  Created by Mark Battistella on 25/10/21.
//

import Foundation

@MainActor final class ListViewModel: ObservableObject {
	
	@Published var appertisers: [Appertiser] = []
	@Published var alertItem: AlertItem?
	@Published var isLoading = false
	@Published var selectedAppertiser: Appertiser!
	@Published var isShowingDetail = false

	func getAppertisers() {
		isLoading = true
		
		Task {
			do {
				appertisers = try await NetworkManager.shared.getAppetisers()
				isLoading = false
			} catch {
				
				if let apError = error as? APError {
					switch apError {
						case .invalidURL:
							alertItem = AlertContext.invalidURL
						case .invalidResponse:
							alertItem = AlertContext.invalidResponse
						case .invalidData:
							alertItem = AlertContext.invalidData
						case .unableToComplete:
							alertItem = AlertContext.unableToComplete
					}
				} else {
					alertItem = AlertContext.invalidURL
				}
				isLoading = false
			}
		}
	}
}

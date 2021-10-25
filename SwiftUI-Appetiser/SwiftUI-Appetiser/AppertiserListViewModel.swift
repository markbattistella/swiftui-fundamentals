//
//  AppertiserListViewModel.swift
//  SwiftUI-Appetisers
//
//  Created by Mark Battistella on 25/10/21.
//

import Foundation

final class AppertiserListViewModel: ObservableObject {
	
	@Published var appertisers: [Appertiser] = []
	@Published var alertItem: AlertItem?

	
	func getAppertisers() {
		NetworkManager.shared.getAppetisers { result in
			DispatchQueue.main.async {
				switch result {
					case .success(let appertisers):
						self.appertisers = appertisers
						
					case .failure(let error):
						switch error {
							case .invalidURL:
								self.alertItem = AlertContext.invalidURL
								
							case .invalidResponse:
								self.alertItem = AlertContext.invalidResponse
								
							case .invalidData:
								self.alertItem = AlertContext.invalidData
								
							case .unableToComplete:
								self.alertItem = AlertContext.unableToComplete
						}
				}
			}
		}
	}
}

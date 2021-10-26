//
//  AccountViewModel.swift
//  SwiftUI-Appetisers
//
//  Created by Mark Battistella on 26/10/21.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
	
	@AppStorage("user") private var userData: Data?
	@Published var user = User()
	@Published var alertItem: AlertItem?

	
	var isValidForm: Bool {
		
		// not empty form
		guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.emailAddress.isEmpty else {
			alertItem = AlertContext.invalidForm
			return false
		}
		
		// valid email
		guard user.emailAddress.isValidEmail else {
			alertItem = AlertContext.invalidEmail
			return false
		}

		return true
	}



	func saveChanges() {
		guard isValidForm else { return }

		do {
			let data = try JSONEncoder().encode(user)
			userData = data
			alertItem = AlertContext.userSaveSuccess
		} catch {
			alertItem = AlertContext.userSaveFailed
		}
	}


	func retrieveUser() {
		guard let userData = userData else { return }
		do {
			user = try JSONDecoder().decode(User.self, from: userData)
		} catch {
			alertItem = AlertContext.userSaveFailed
		}
	}
}

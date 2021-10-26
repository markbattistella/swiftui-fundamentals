//
//  AccountView.swift
//  SwiftUI-Appetisers
//
//  Created by Mark Battistella on 22/10/21.
//

import SwiftUI

struct AccountView: View {
	
	@StateObject var viewModel = AccountViewModel()

    var body: some View {

		NavigationView {
			
			Form {
				
				Section {
					TextField("First name", text: $viewModel.user.firstName)
						.autocapitalization(.words)
					TextField("Last name", text: $viewModel.user.lastName)
						.autocapitalization(.words)
					TextField("Email address", text: $viewModel.user.emailAddress)
						.keyboardType(.emailAddress)
						.autocapitalization(.none)
						.disableAutocorrection(true)
					
					DatePicker(
						"Birthday",
						selection: $viewModel.user.birthdate,
						displayedComponents: .date
					)
					
					Button {
						viewModel.saveChanges()
					} label: {
						Text("Save changes")
					}
				} header: {
					Text("Personal info")
				}

				
				// -- additional info
				Section {
					Toggle("Extra napkins", isOn: $viewModel.user.extraNapkins)
					Toggle("Frequent refills", isOn: $viewModel.user.frequentRefills)
				} header: {
					Text("Requests")
				}
				.toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
			}
			
			.onAppear(perform: {
				viewModel.retrieveUser()
			})
			
			.alert(item: $viewModel.alertItem, content: { alertItem in
				Alert(
					title: alertItem.title,
					message: alertItem.message,
					dismissButton: alertItem.dismissButton
				)
			})
			
			.navigationTitle("Account")
		}
	}
}

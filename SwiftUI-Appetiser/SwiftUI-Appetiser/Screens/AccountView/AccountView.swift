//
//  AccountView.swift
//  SwiftUI-Appetisers
//
//  Created by Mark Battistella on 22/10/21.
//

import SwiftUI

struct AccountView: View {
	
	@StateObject var viewModel = AccountViewModel()
	@FocusState private var focusedTextField: FormTextField?
	
	enum FormTextField {
		case firstName, lastName, emailAddress
	}

    var body: some View {

		NavigationView {
			
			Form {
				
				Section {
					TextField("First name", text: $viewModel.user.firstName)
						.autocapitalization(.words)
						.focused($focusedTextField, equals: .firstName)
						.onSubmit { focusedTextField = .lastName }
						.submitLabel(.next)

					TextField("Last name", text: $viewModel.user.lastName)
						.autocapitalization(.words)
						.focused($focusedTextField, equals: .lastName)
						.onSubmit { focusedTextField = .emailAddress }
						.submitLabel(.next)
					
					TextField("Email address", text: $viewModel.user.emailAddress)
						.keyboardType(.emailAddress)
						.autocapitalization(.none)
						.disableAutocorrection(true)
						.focused($focusedTextField, equals: .emailAddress)
						.onSubmit { focusedTextField = nil }
						.submitLabel(.done)
					
					DatePicker(
						"Birthday",
						selection: $viewModel.user.birthdate,
						displayedComponents: .date
					)
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
				
				//
				Section {
					Button {
						viewModel.saveChanges()
					} label: {
						Text("Save changes")
					}
				}
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
			.toolbar {
				ToolbarItemGroup(placement: .keyboard) {
					Button("Dismiss") {
						focusedTextField = nil
					}
				}
			}
		}
	}
}

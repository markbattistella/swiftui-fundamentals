//
//  Alert.swift
//  SwiftUI-Appetisers
//
//  Created by Mark Battistella on 25/10/21.
//

import SwiftUI

struct AlertItem: Identifiable {
	let id = UUID()
	let title: Text
	let message: Text
	let dismissButton: Alert.Button
}

struct AlertContext {
	
	// MARK: - network
	static let invalidData = AlertItem(
		title: Text("Server Error"),
		message: Text("The data from the server was invalid."),
		dismissButton: .default(Text("OK"))
	)
	
	static let invalidResponse = AlertItem(
		title: Text("Server Error"),
		message: Text("The server response was invalid."),
		dismissButton: .default(Text("OK"))
	)

	static let invalidURL = AlertItem(
		title: Text("Server Error"),
		message: Text("There was an issue connecting to the server."),
		dismissButton: .default(Text("OK"))
	)

	static let unableToComplete = AlertItem(
		title: Text("Server Error"),
		message: Text("Unable to complete your request at this time."),
		dismissButton: .default(Text("OK"))
	)


	// MARK: - accounts
	static let invalidForm = AlertItem(
		title: Text("Invalid form"),
		message: Text("Please fill in all fields"),
		dismissButton: .default(Text("OK"))
	)

	static let invalidEmail = AlertItem(
		title: Text("Invalid email"),
		message: Text("Please fix your email address"),
		dismissButton: .default(Text("OK"))
	)

	static let userSaveSuccess = AlertItem(
		title: Text("Profile saved"),
		message: Text("Profile data saved"),
		dismissButton: .default(Text("OK"))
	)

	static let userSaveFailed = AlertItem(
		title: Text("Profile save error"),
		message: Text("Profile data was not saved"),
		dismissButton: .default(Text("OK"))
	)
}

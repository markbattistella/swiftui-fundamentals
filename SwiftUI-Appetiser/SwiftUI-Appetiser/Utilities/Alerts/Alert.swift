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
}

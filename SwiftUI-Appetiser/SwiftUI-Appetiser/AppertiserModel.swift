//
//  AppertiserModel.swift
//  SwiftUI-Appetisers
//
//  Created by Mark Battistella on 22/10/21.
//

import Foundation

struct AppertiserResponse: Decodable {
	let request: [Appertiser]
}
struct Appertiser: Decodable, Identifiable {
	let id: Int
	let name: String
	let description: String
	let price: Double
	let imageURL: String
	let calories: Int
	let protein: Int
	let carbs: Int
}


struct MockData {
	static let sampleAppetiserOne = Appertiser(
		id: 0001,
		name: "Test Appertiser 1",
		description: "This is the description for the test appertiser",
		price: 9.99,
		imageURL: "",
		calories: 77,
		protein: 88,
		carbs: 99
	)
	
	static let sampleAppetiserTwo = Appertiser(
		id: 0002,
		name: "Test Appertiser 2",
		description: "This is the description for the test appertiser",
		price: 9.99,
		imageURL: "",
		calories: 77,
		protein: 88,
		carbs: 99
	)
	static let sampleAppetiserThree = Appertiser(
		id: 0003,
		name: "Test Appertiser 3",
		description: "This is the description for the test appertiser",
		price: 9.99,
		imageURL: "",
		calories: 77,
		protein: 88,
		carbs: 99
	)
	static let sampleAppetiserFour = Appertiser(
		id: 0004,
		name: "Test Appertiser 4",
		description: "This is the description for the test appertiser",
		price: 9.99,
		imageURL: "",
		calories: 77,
		protein: 88,
		carbs: 99
	)
	
	static let appertisers = [
		sampleAppetiserOne,
		sampleAppetiserTwo,
		sampleAppetiserThree,
		sampleAppetiserFour
	]
}

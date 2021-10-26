//
//  User.swift
//  SwiftUI-Appetisers
//
//  Created by Mark Battistella on 26/10/21.
//

import Foundation

struct User: Codable {
	
	var firstName = ""
	var lastName = ""
	var emailAddress = ""
	var birthdate = Date()
	var extraNapkins = false
	var frequentRefills = false

}

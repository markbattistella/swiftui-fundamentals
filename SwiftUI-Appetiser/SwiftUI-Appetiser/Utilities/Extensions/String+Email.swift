//
//  String+Email.swift
//  SwiftUI-Appetisers
//
//  Created by Mark Battistella on 26/10/21.
//

import Foundation

extension String {
	
	var isValidEmail: Bool {
		let emailFormat         = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
		let emailPredicate      = NSPredicate(format: "SELF MATCHES %@", emailFormat)
		return emailPredicate.evaluate(with: self)
	}
}

//
//  WeatherButton.swift
//  SwiftUI-WeatherApp
//
//  Created by Mark Battistella on 7/8/21.
//

import SwiftUI

struct WeatherButton: View {
	
	var title: String
	var textColour: Color
	var backgroundColour: Color
	
	var body: some View {
		Text( title )
			.frame(width: 280, height: 50)
			.background( backgroundColour )
			.foregroundColor( textColour )
			.font(.system(size: 20, weight: .bold))
			.cornerRadius(50)
	}
}

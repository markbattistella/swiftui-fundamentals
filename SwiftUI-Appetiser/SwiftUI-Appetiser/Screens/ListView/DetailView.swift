//
//  DetailView.swift
//  SwiftUI-Appetisers
//
//  Created by Mark Battistella on 25/10/21.
//

import SwiftUI

struct DetailView: View {

	let appertiser: Appertiser
	
	var body: some View {
		
		VStack {

			Image("")
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(width: 300, height: 225)
			
			VStack {
				Text(appertiser.name)
					.font(.title2)
					.fontWeight(.semibold)
				
				Text(appertiser.description)
					.multilineTextAlignment(.center)
					.font(.body)
					.padding()
				
				HStack(spacing: 40) {
					VStack(spacing: 5) {
						Text("Calories")
							.font(.caption)
							.bold()
						
						Text("\(appertiser.calories)")
							.foregroundColor(.secondary)
							.fontWeight(.semibold)
							.italic()
					}
					
					VStack(spacing: 5) {
						Text("Carbs")
							.font(.caption)
							.bold()
						
						Text("\(appertiser.carbs)")
							.foregroundColor(.secondary)
							.fontWeight(.semibold)
							.italic()
					}
					
					VStack(spacing: 5) {
						Text("Protein")
							.font(.caption)
							.bold()
						
						Text("\(appertiser.protein)")
							.foregroundColor(.secondary)
							.fontWeight(.semibold)
							.italic()
					}
				}
				
				Spacer()
				
				Button {
					//
				} label: {
					Text("$\(appertiser.price, specifier: "%.2f") - Add to order")
						.font(.title3)
						.fontWeight(.semibold)
						.frame(width: 260, height: 50)
						.foregroundColor(.white)
						.background(Color.brandPrimary)
						.cornerRadius(10)
				}
				.padding(.bottom)
			}
			
		}
		.frame(width: 300, height: 525)
		.background(Color(.systemBackground))
		.cornerRadius(12)
		.shadow(radius: 40)
		
		.overlay(
			Button {
				//
			} label: {
				ZStack {
					Circle()
						.frame(width: 30, height: 30)
						.foregroundColor(.white)
						.opacity(0.6)
					Image(systemName: "xmark")
						.imageScale(.small)
						.frame(width: 44, height: 44)
						.foregroundColor(.black)
				}
			},
			alignment: .topTrailing
		)
	}
}

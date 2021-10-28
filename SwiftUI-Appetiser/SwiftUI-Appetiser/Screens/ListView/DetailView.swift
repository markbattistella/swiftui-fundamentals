//
//  DetailView.swift
//  SwiftUI-Appetisers
//
//  Created by Mark Battistella on 25/10/21.
//

import SwiftUI

struct DetailView: View {

	@EnvironmentObject var order: Order
	
	let appertiser: Appertiser
	@Binding var isShowingDetail: Bool
	
	var body: some View {
		
		VStack {

			AppertiserRemoteImage(urlString: appertiser.imageURL)
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
					NutritionInfo(title: "Calories", value: appertiser.calories)
					NutritionInfo(title: "Carbs", value: appertiser.carbs)
					NutritionInfo(title: "Protien", value: appertiser.protein)
				}
				
				Spacer()
				
				Button {
					order.add(appertiser)
					
					DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
						isShowingDetail = false
					}
				} label: {
					APButton(title: "$\(appertiser.price, specifier: "%.2f") - Add to order")
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
				isShowingDetail = false
			} label: {
				ZStack {
					XDismissButton()
				}
			},
			alignment: .topTrailing
		)
	}
}


struct NutritionInfo: View {
	let title: String
	let value: Int
	
	var body: some View {
		VStack(spacing: 5) {
			Text(title)
				.font(.caption)
				.bold()
			
			Text("\(value)")
				.foregroundColor(.secondary)
				.fontWeight(.semibold)
				.italic()
		}
	}
}

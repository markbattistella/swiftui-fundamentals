//
//  ContentView.swift
//  SwiftUI-WeatherApp
//
//  Created by Mark Battistella on 7/8/21.
//

import SwiftUI

struct ContentView: View {
	
	@State private var isNight = false
	
	var body: some View {
		ZStack {
			
			BackgroundView( isNight: $isNight )
			
			VStack {
				
				CityTextView(cityName: "Melbourne, VIC")
				
				VStack(spacing: 10) {
					
					MainWeatherView(
						imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
						temperature: 34
					)
				}
				.padding(.bottom, 40)
				
				HStack(spacing: 25) {
					WeatherDayView(
						dayOfTheWeek: "TUE",
						imageName: "cloud.sun.fill",
						temperature: 20 )
					WeatherDayView(
						dayOfTheWeek: "WED",
						imageName: "cloud.drizzle.fill",
						temperature: 12 )
					WeatherDayView(
						dayOfTheWeek: "THU",
						imageName: "cloud.bolt.fill",
						temperature: 9 )
					WeatherDayView(
						dayOfTheWeek: "FRI",
						imageName: "wind",
						temperature: 13 )
					WeatherDayView(
						dayOfTheWeek: "SAT",
						imageName: "cloud.fog.fill",
						temperature: 5 )
				}
				
				Spacer()
				
				Button {
					isNight.toggle()
				} label: {
					WeatherButton(
						title: "Change day time",
						textColour: .blue,
						backgroundColour: .white
					)
				}
				
				Spacer()
			}
		}
	}
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}

// MARK: - Sub Views
struct WeatherDayView: View {
	
	var dayOfTheWeek: String
	var imageName: String
	var temperature: Int
	
	var body: some View {
		VStack {
			Text( dayOfTheWeek )
				.foregroundColor(.white)
				.font(.system(size: 16, weight: .medium))
			Image(systemName: imageName)
				.renderingMode(.original)
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(width: 40, height: 40)
			Text("\(temperature)°")
				.foregroundColor(.white)
				.font(.system(size: 28, weight: .medium))
		}
	}
}

struct BackgroundView: View {
	
	@Binding var isNight: Bool
	
	var body: some View {
		LinearGradient(
			gradient: Gradient(colors: [
								isNight ? .black : .blue,
								isNight ? .gray : Color("lightBlue")
			]),
			startPoint: .topLeading,
			endPoint: .bottomTrailing
		)
		.edgesIgnoringSafeArea(.all)
	}
}

struct CityTextView: View {
	var cityName: String
	
	var body: some View {
		Text( cityName )
			.font(.system(size: 36, weight: .medium))
			.foregroundColor(.white)
			.padding()
	}
}

struct MainWeatherView: View {
	var imageName: String
	var temperature: Int
	
	var body: some View {
		Image(systemName: imageName)
			.renderingMode(.original)
			.resizable()
			.aspectRatio(contentMode: .fit)
			.frame(width: 180, height: 180)
		
		Text("\(temperature)°")
			.font(.system(size: 70, weight: .medium))
			.foregroundColor(.white)
	}
}



//
//  NetworkManager.swift
//  SwiftUI-Appetisers
//
//  Created by Mark Battistella on 25/10/21.
//

import Foundation

final class NetworkManager {
	
	static let shared = NetworkManager()
	
	static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
	private let appertiserURL  = baseURL + "appetizers"

	private init() {}

	
	func getAppetisers(completed: @escaping (Result<[Appertiser], APError>) -> Void) {
		
		guard let url = URL(string: appertiserURL) else {
			completed(.failure(.invalidURL))
			return
		}
		
		let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
			
			if let _ = error {
				completed(.failure(.unableToComplete))
				return
			}
			
			guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
				completed(.failure(.invalidResponse))
				return
			}
			
			guard let data = data else {
				completed(.failure(.invalidData))
				return
			}

			do {
				let decoder = JSONDecoder()
				let decodedResponse = try decoder.decode(AppertiserResponse.self, from: data)
				
				completed(.success(decodedResponse.request))

			} catch {
				completed(.failure(.unableToComplete))
			}

		}
		
		task.resume()
	}
}

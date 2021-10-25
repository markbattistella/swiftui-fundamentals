//
//  NetworkManager.swift
//  SwiftUI-Appetisers
//
//  Created by Mark Battistella on 25/10/21.
//

import UIKit

final class NetworkManager {
	
	static let shared = NetworkManager()
	
	private let cache = NSCache<NSString, UIImage>()
	
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


	func downloadImage(fromUrlString urlString: String, completed: @escaping (UIImage?) -> Void) {
		
		let cacheKey = NSString(string: urlString)
		
		// check the cache first for image
		if let image = cache.object(forKey: cacheKey) {
			completed(image)
			return
		}
		
		guard let url = URL(string: urlString) else {
			completed(nil)
			return
		}
		
		let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
			
			// check the data
			// and it is image
			guard let data = data, let image = UIImage(data: data) else {
			  completed(nil)
			  return
			}
			
			// save item to cache
			self.cache.setObject(image, forKey: cacheKey)
			
			completed(image)
		}
		task.resume()
	}

}

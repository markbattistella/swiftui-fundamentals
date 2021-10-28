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
	
	
	func getAppetisers() async throws -> [Appertiser] {
		guard let url = URL(string: appertiserURL) else {
			throw APError.invalidURL
		}
		
		let (data, response) = try await URLSession.shared.data(from: url)
		
		guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
			throw APError.invalidResponse
		}
		
		do {
			let decoder = JSONDecoder()
			return try decoder.decode(AppertiserResponse.self, from: data).request
		} catch {
			throw APError.unableToComplete
		}
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

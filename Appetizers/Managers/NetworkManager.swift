//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Muhammad Usman Saeed on 20/11/2023.
//

import Foundation
import UIKit

final class NetworkManager {

    static let shared = NetworkManager()
    private init(){}
    
    private let cache = NSCache<NSString, UIImage>()
    
    static let baseURL = "https://my-json-server.typicode.com/m-usmansaeed/fakeserver/"
    private let appetizerURL = baseURL + "recipies"

    
    func getAppetizers(completed: @escaping (Result<[Appetizer], APError>) -> Void) {
        guard let url = URL(string: appetizerURL) else {
            completed(.failure(.invalidURL))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
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
                let results = try decoder.decode([Appetizer].self, from: data)
                completed(.success(results))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void) {
        
        let cacheKey = NSString(string: urlString)
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }else{
            guard let url = URL(string: urlString) else { return }
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, let image = UIImage(data: data) else {
                    completed(nil)
                    return }
                
                self.cache.setObject(image, forKey: cacheKey)
                completed(image)
            }
            
            task.resume()
        }
    }
    
}

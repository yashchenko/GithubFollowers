//
//  NetworkManager.swift
//  GithubFollowers
//
//  Created by Ivan on 17.05.2024.
//

import UIKit

class NetworkManager {
    static let sharedSingleton = NetworkManager()
    
    private init() {}
    
    let baseURL = "https://api.github.com/users/"
    
    func getFollowers(username: String, page: Int, completed: @escaping (Result<[Follower], GFErrorEnum>) -> Void) {
        let endpoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidUrlRequest))
            return
        }
        
        let _ = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completed(.failure(.errorInErrorSection))
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidServerResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.noData))
                return
            }
            
            do {
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(.success(followers))
            } catch {
                completed(.failure(.decodingFailed))
            }
            
        }.resume()
    }
}

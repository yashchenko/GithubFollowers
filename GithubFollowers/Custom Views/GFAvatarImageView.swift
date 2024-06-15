//
//  GFAvatarImageView.swift
//  GithubFollowers
//
//  Created by Ivan on 27.05.2024.
//

import UIKit

class GFAvatarImageView: UIImageView {
    
    let cache = NetworkManager.sharedSingleton.cache
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        guard let placeholderImage = UIImage(named: "avatar-placeholder") else {
            print("you didn't have right image in assets")
            return
        }
        
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func downloadImage(urlString: String) {
        
        let cacheKey = NSString(string: urlString) // creating cache instance
        
        if let image = cache.object(forKey: cacheKey) { // check if this image already in cache then in brackets we assigned this image to imageView
            self.image = image
            return // return have a crucial role, it interrupted code and not allow perform subsequent code, cause we already got image from cache, why we should downloading from internet? so return is prevent this
        }
        
        
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            
            if error != nil { return }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            guard let data = data else { return }
            
            guard let image = UIImage(data: data) else { return } // perform just once, puts the image into cache
            self.cache.setObject(image, forKey: cacheKey)
            
            DispatchQueue.main.async {
                self.image = image
            }
        }.resume()
    }
}

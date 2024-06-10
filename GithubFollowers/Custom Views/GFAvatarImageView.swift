//
//  GFAvatarImageView.swift
//  GithubFollowers
//
//  Created by Ivan on 27.05.2024.
//

import UIKit

class GFAvatarImageView: UIImageView {
    
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
}

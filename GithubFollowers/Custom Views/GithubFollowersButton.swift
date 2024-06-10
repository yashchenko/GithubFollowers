//
//  GithubFollowersButton.swift
//  GithubFollowers
//
//  Created by Ivan on 24.04.2024.
//

import UIKit

class GithubFollowersButton: UIButton {
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backgroundColour: UIColor, titleSome: String) {
        super.init(frame: .zero)
        backgroundColor = backgroundColour
        setTitle(titleSome, for: .normal)
        configure()
    }
    
    func configure() {
        layer.cornerRadius = 10
        titleLabel?.textColor = .white
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
    }
}

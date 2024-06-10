//
//  GithubFollowersTextField.swift
//  GithubFollowers
//
//  Created by Ivan on 25.04.2024.
//

import UIKit

class GithubFollowersTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray4.cgColor
        
        textColor = .label
        tintColor = .label
        textAlignment = .center
        font = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12
        
        backgroundColor = .tertiarySystemBackground
        autocorrectionType = .no
        //keyboardAppeara
        placeholder = "Enter a username"
        returnKeyType = .go
        translatesAutoresizingMaskIntoConstraints = false
    }
}

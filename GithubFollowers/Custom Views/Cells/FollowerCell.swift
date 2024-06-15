//
//  CollectionViewCell.swift
//  GithubFollowers
//
//  Created by Ivan on 27.05.2024.
//

import UIKit

class FollowerCell: UICollectionViewCell {
    static let reuseID = "FollowerCell"
    
    let avatarImageView = GFAvatarImageView(frame: .zero)
    let usernamaLabel = GFErrorTitleLabel(textAlignment: .center, fontSize: 16)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(follower: Follower) {
        usernamaLabel.text = follower.login
        avatarImageView.downloadImage(urlString: follower.avatarUrl)
    }
    
    func configure() {
        addSubViews(views: [
            avatarImageView,
            usernamaLabel
        ])
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            avatarImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
            
            usernamaLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 12),
            usernamaLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            usernamaLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            usernamaLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}

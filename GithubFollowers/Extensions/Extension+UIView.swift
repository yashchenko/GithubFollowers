//
//  Extension+UIView.swift
//  GithubFollowers
//
//  Created by Ivan on 27.04.2024.
//

import UIKit

extension UIView {
    func addSubViews(views: [UIView]) {
        views.forEach { child in
            self.addSubview(child)
        }
    }
}

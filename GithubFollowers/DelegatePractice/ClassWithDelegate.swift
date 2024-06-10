//
//  ClassWithDelegate.swift
//  GithubFollowers
//
//  Created by Ivan on 13.05.2024.
//

import UIKit

class ClassWithDelegate {
    func callDelegateMethod(delegate: DelegateProtocol) {
        delegate.performAction()
    }
}

// call (usage)

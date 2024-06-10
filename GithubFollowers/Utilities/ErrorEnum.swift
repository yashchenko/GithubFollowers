//
//  ErrorEnum.swift
//  GithubFollowers
//
//  Created by Ivan on 19.05.2024.
//

import UIKit

enum GFErrorEnum: String, Error {
    case invalidUrlRequest = "invalid request"
    case errorInErrorSection = "an error has occured in error section"
    case invalidServerResponse = "invalid response from server"
    case noData = "data is missing"
    case decodingFailed = "decoding failed, corrupted data"
}

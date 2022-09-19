//
//  NetworkHelper.swift
//  NYTimesNewsApp
//
//  Created by Rustam Manafov on 14.08.22.
//

import Foundation

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
}

enum ErrorTypes: String, Error {
    case invalidData = "Invalid data"
    case invalidURL = "Invalid url"
    case generalError = "An error happened"
}

class NetworkHelper {
    static let shared = NetworkHelper()
    
    let baseURL = "https://api.nytimes.com/svc"
    
    let imageBaseURL = "https://static01.nyt.com/"
    
    let header = ["X-Session": KeychainHelper.get(key: .token)]
    
    func saveToken(token: String) {
        KeychainHelper.save(value: token, key: .token)        
    }
}

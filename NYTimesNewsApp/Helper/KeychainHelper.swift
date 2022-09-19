//
//  KeychainHelper.swift
//  NYTimesNewsApp
//
//  Created by Rustam Manafov on 30.08.22.
//

import Foundation
import KeychainSwift

class KeychainHelper {
    static let keychain = KeychainSwift()
    
    enum KeychainType: String {
        case token = "accessToken"
        case password
        case email
        
        static let items: [KeychainType] = [.token, .email, .password]
    }
    
    static func save(value: String, key: KeychainType) {
        keychain.set(value, forKey: key.rawValue)
    }
    
    static func get(key: KeychainType) -> String {
        keychain.get(key.rawValue) ?? ""
    }
    
    static func delete(key: KeychainType) {
        keychain.delete(key.rawValue)
    }
    
    static func deleteAll() {
//        KeychainType.items.forEach { item in
//            keychain.delete(item.rawValue)
//        }
        
        for item in KeychainType.items {
            keychain.delete(item.rawValue)
        }
    }
}

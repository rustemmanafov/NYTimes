//
//  UserDefaultsHelper.swift
//  NYTimesNewsApp
//
//  Created by Rustam Manafov on 30.08.22.
//

import Foundation

class UserDefaultsHelper {
    
    enum UserDefaultType: String {
        case isLoggedIn
        case onboardingPassed
        case username
        
        static let items: [UserDefaultType] = [.isLoggedIn, .onboardingPassed, .username]
    }
    
    static func save(value: Any, key: UserDefaultType) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }
    
    static func get(key: UserDefaultType) -> Any? {
        UserDefaults.standard.object(forKey: key.rawValue)
    }    
    
    static func saveBool(value: Bool, key: UserDefaultType) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }
    
    static func string(key: UserDefaultType) -> String {
        UserDefaults.standard.string(forKey: key.rawValue) ?? ""
    }
    
    static func delete(key: UserDefaultType) {
        UserDefaults.standard.removeObject(forKey: key.rawValue)
    }
}

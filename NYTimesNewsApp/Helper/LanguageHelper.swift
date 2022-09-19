//
//  LanguageHelper.swift
//  NYTimesNewsApp
//
//  Created by Rustam Manafov on 01.09.22.
//

import Foundation
import Localize_Swift

class LanguageHelper {
    static func setLanguage(_ code: String) {
        Localize.setCurrentLanguage(code)
    }
    
    static func getLanguage() -> String {
        Localize.currentLanguage()
    }
    
    static func displayLanguage(_ code: String) -> String {
        Localize.displayNameForLanguage(code)
    }
}

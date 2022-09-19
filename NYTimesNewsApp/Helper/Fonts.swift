//
//  Fonts.swift
//  UnimApp
//
//  Created by Rustam Manafov on 11.09.21.
//

import UIKit

class Fonts {
    enum FontNames: String {
        case bold = "Roboto-Bold"
        case black = "Roboto-Black"
        case blackItalic = "Roboto-BlackItalic"
        case medium = "Roboto-Medium"
        case regular = "Roboto-Regular"
        case semiBold = "Roboto-SemiBold"
        case extraBold = "Roboto-ExtraBold"
    }
    
    static func getFont(name: FontNames, size: CGFloat) -> UIFont? {
        UIFont(name: name.rawValue, size: size)      
    }
}

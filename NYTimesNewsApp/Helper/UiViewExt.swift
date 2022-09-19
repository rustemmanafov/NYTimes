//
//  UiViewExt.swift
//  NYTimesNewsApp
//
//  Created by Rustem Manafov on 19.09.22.
//

import Foundation
import UIKit

extension UIView {
    func setupBorder(_ width: CGFloat, _ color: UIColor = .black.withAlphaComponent(0.1)) {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }
}

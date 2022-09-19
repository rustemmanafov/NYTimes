//
//  String+Ext.swift
//  NYTimesNewsApp
//
//  Created by Rustam Manafov on 30.08.22.
//

import Foundation

enum LocalizationKey: String {
    case archiveList = "archiveTitle"
}

extension String {
    func localize(key: LocalizationKey) -> String {
        NSLocalizedString(key.rawValue, comment: "")
    }
}

//
//  Settings.swift
//  NYTimesNewsApp
//
//  Created by Rustam Manafov on 01.09.22.
//

import Foundation

enum SettingsType {
    case langauge
}

struct Settings {
    let title: String
    let type: SettingsType
}

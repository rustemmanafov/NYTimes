//
//  SettingsViewModel.swift
//  NYTimesNewsApp
//
//  Created by Rustam Manafov on 01.09.22.
//

import Foundation


class SettingsViewModel {
    var items = [Settings]()
    
    func configList() {
        items = [Settings(title: "language".localized(), type: .langauge)]
    }
}

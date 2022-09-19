//
//  ArchiveViewModel.swift
//  NYTimesNewsApp
//
//  Created by Rustam Manafov on 23.08.22.
//

import Foundation

class ArchiveViewModel {
    var items = [Article]()
    
    var successCallback: (()->())?
    var errorCallback: ((String)->())?
    
    func getList() {
        ArchiveManager.shared.getArchiveNewsList { items, errorMessage in
            if let errorMessage = errorMessage {
                self.errorCallback?(errorMessage)
            } else if let docs = items?.response?.docs {
                self.items = docs
                self.successCallback?()
            }
        }
    }
    
    func searchArticles(text: String) {
        ArchiveManager.shared.searchArchive(text: text) { items, errorMessage in
            if let errorMessage = errorMessage {
                self.errorCallback?(errorMessage)
            } else if let docs = items?.response?.docs {
                self.items = docs
                self.successCallback?()
            }
        }
    }
    
    func searchCategoiry(lang: String = "", category: String = "") {
        ArchiveManager.shared.searchArchive(lang: lang, category: category) { _, _ in
            
        }
    }
}

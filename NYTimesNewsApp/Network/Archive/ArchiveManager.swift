//
//  ArchiveManager.swift
//  NYTimesNewsApp
//
//  Created by Rustam Manafov on 23.08.22.
//

import Foundation

class ArchiveManager {
    static let shared = ArchiveManager()
    
    func getArchiveNewsList(complete: @escaping((Archive?, String?)->())) {
        let url = NetworkHelper.shared.baseURL + "/archive/v1/2022/1.json?api-key=wQApKyTUq8E5THM9HVdOGem7gohHBZTj"
        
        NetworkManager.shared.request(type: Archive.self,
                                      url: url,
                                      method: .get) { response in
            switch response {
            case .success(let model):
                complete(model, nil)
            case .failure(let error):
                complete(nil, error.localizedDescription)
            }
        }
    }
    
    func searchArchive(text: String, complete: @escaping((Archive?, String?)->())) {
        let url = NetworkHelper.shared.baseURL + "/search/v2/articlesearch.json?q=\(text)&api-key=wQApKyTUq8E5THM9HVdOGem7gohHBZTj"
        
        NetworkManager.shared.request(type: Archive.self,
                                      url: url,
                                      method: .get) { response in
            switch response {
            case .success(let model):
                complete(model, nil)
            case .failure(let error):
                complete(nil, error.localizedDescription)
            }
        }
    }
    
    func searchArchive(lang: String = "", category: String = "", complete: @escaping((Archive?, String?)->())) {
        let url = NetworkHelper.shared.baseURL + "/search/v2/articlesearch.json?lang=\(lang)&category=\(category)&api-key=wQApKyTUq8E5THM9HVdOGem7gohHBZTj"
        
        NetworkManager.shared.request(type: Archive.self,
                                      url: url,
                                      method: .get) { response in
            switch response {
            case .success(let model):
                complete(model, nil)
            case .failure(let error):
                complete(nil, error.localizedDescription)
            }
        }
    }
}

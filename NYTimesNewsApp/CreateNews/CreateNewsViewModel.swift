//
//  CreateNewsViewModel.swift
//  NYTimesNewsApp
//
//  Created by Rustem Manafov on 19.09.22.
//

import Foundation
import FirebaseFirestore

class CreateNewsViewModel {
    
    func createNews(title: String, desc: String, complete: @escaping(()->())) {
        let data: [String: Any] = ["title": title, "desc": desc, "url": ""]
        let collection = Firestore.firestore().collection("MyNews").document("list")
        collection.updateData(["items": FieldValue.arrayUnion([data])]) { error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                complete()
            }
        }
    }
}

//
//  MyNewsViewModel.swift
//  NYTimesNewsApp
//
//  Created by Rustam Manafov on 06.09.22.
//

import Foundation
import FirebaseFirestore

class MyNewsViewModel {
    var items = [MyNews]()
    
    func getMyNews(complete: @escaping(()->())) {
        let db = Firestore.firestore()
        let collection = db.collection("MyNews").document("list")
        collection.getDocument { snapshot, error in
            if let snapshot = snapshot, snapshot.exists, let data = snapshot.data() {
                if let data = try? JSONSerialization.data(withJSONObject: data, options: []) {
                    guard let items = try? JSONDecoder().decode(NewsItems.self, from: data) else { return }
                    self.items = items.items ?? []
                    complete()
                }
            } else {
                print("error")
            }
        }
    }
}

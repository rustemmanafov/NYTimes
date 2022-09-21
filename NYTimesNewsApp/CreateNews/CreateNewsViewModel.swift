//
//  CreateNewsViewModel.swift
//  NYTimesNewsApp
//
//  Created by Rustem Manafov on 19.09.22.
//

import Foundation
import FirebaseFirestore
import FirebaseCoreInternal
import FirebaseStorage

class CreateNewsViewModel {
    
    func createNews(title: String, desc: String, complete: @escaping(()->())) {
        let data: [String: Any] = ["title": title, "desc": desc, "url": "\(title).png"]
        let collection = Firestore.firestore().collection("MyNews").document("list")
        collection.updateData(["items": FieldValue.arrayUnion([data])]) { error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                complete()
            }
        }
    }
    
    func uploadImage(image: UIImage, name: String, complete: @escaping(()->())) {
        let ref = Storage.storage().reference()
        let imageRef = ref.child("\(name).png")
        
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        
        let data = image.jpegData(compressionQuality: 0.4) ?? Data()
        let _ = imageRef.putData(data, metadata: metadata) {_, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                complete()
            }
            
        }
        
    }
}



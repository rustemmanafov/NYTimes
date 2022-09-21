//
//  CreateNewsController.swift
//  NYTimesNewsApp
//
//  Created by Rustem Manafov on 19.09.22.
//

import UIKit

class CreateNewsController: UIViewController {
    
    @IBOutlet private weak var titleTextField: UITextField!
    @IBOutlet private weak var descTextView: UITextView!
    @IBOutlet private weak var photoImage: UIImageView!
    @IBOutlet private weak var createButton: UIButton!
    
    let viewModel = CreateNewsViewModel()
    
    var isPhotoSelected = false

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(removeKeyboard)))
        
        descTextView.setupBorder(1)
        createButton.setupBorder(1)
    }
    
    @objc fileprivate func removeKeyboard() {
        descTextView.resignFirstResponder()
        titleTextField.resignFirstResponder()
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Choose one option", message: "", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
            self.setUpImagePicker(type: .camera)

        }))
        
        alert.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { _ in
            self.setUpImagePicker(type: .photoLibrary)
            
        }))
        present(alert, animated: true, completion: nil)

    }
    
    @IBAction func createButtonTapped(_ sender: Any) {
        if let textCheck = titleTextField.text?.isEmpty, !textCheck, !descTextView.text.isEmpty {
          
            if isPhotoSelected {
                viewModel.uploadImage(image: photoImage.image ?? UIImage(), name: titleTextField.text ?? "") {
                    self.viewModel.createNews(title: self.titleTextField.text ?? "",
                                              desc: self.descTextView.text) {
                        
                        self.descTextView.text = ""
                        self.titleTextField.text = ""
                        self.photoImage.image = nil
                }
            }
            } else {
                viewModel.createNews(title: titleTextField.text ?? "",
                                          desc: descTextView.text) {
                    
                    self.descTextView.text = ""
                    self.titleTextField.text = ""
                    self.photoImage.image = nil
            }

            }
        }
    }
   

}

extension CreateNewsController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

extension CreateNewsController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func setUpImagePicker(type: UIImagePickerController.SourceType) {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let image = info[.originalImage] as? UIImage
        photoImage.image = image
        isPhotoSelected = true
        picker.dismiss(animated: true, completion: nil)
    }
}

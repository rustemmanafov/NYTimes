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
        
    }
    
    @IBAction func createButtonTapped(_ sender: Any) {
        if let textCheck = titleTextField.text?.isEmpty, !textCheck, !descTextView.text.isEmpty {
            viewModel.createNews(title: titleTextField.text ?? "",
                                 desc: descTextView.text) {
                
                self.descTextView.text = ""
                self.titleTextField.text = ""
            }
        }
    }
   

}

extension CreateNewsController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

//
//  ArchiveController.swift
//  NYTimesNewsApp
//
//  Created by Rustam Manafov on 23.08.22.
//

import UIKit

class ArchiveController: UIViewController {

    @IBOutlet private weak var searchTextField: UITextField!
    @IBOutlet private weak var collection: UICollectionView!
    
    let viewModel = ArchiveViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        configViewModel()
    }
    
    fileprivate func setup() {
        title?.localize(key: .archiveList)
//        title = NSLocalizedString("archiveTitle", comment: "")
        searchTextField.placeholder = NSLocalizedString("typing", comment: "")        
        
        searchTextField.becomeFirstResponder()
        collection.register(UINib(nibName: "\(ArchiveCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(ArchiveCell.self)")
    }
    
    func configViewModel() {
//        showLoader()
//        viewModel.getList()      
        viewModel.errorCallback = { message in
            self.dismissLoader()
            self.showAlert(message: message) {}
        }
        
        viewModel.successCallback = {
            self.dismissLoader()
            self.collection.reloadData()
        }
    }
    
    @IBAction func searchText(_ sender: UITextField) {
        viewModel.searchArticles(text: sender.text ?? "")
    }
}

extension ArchiveController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ArchiveCell.self)", for: indexPath) as! ArchiveCell
        cell.configure(data: viewModel.items[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        showInSafari(url: viewModel.items[indexPath.item].webURL ?? "")
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(CategoryController.self)") as! CategoryController
        controller.selectionCallback = { title in
            self.viewModel.searchCategoiry(category: title)
        }
        show(controller, sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 150)
    }
}

extension ArchiveController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

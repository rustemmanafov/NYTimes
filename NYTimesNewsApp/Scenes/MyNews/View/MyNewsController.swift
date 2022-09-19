//
//  MyNewsController.swift
//  NYTimesNewsApp
//
//  Created by Rustam Manafov on 06.09.22.
//

import UIKit

class MyNewsController: UIViewController {

    @IBOutlet weak var collection: UICollectionView!
    
    let viewModel = MyNewsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collection.register(UINib(nibName: "\(MyNewsCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(MyNewsCell.self)")
        
        viewModel.getMyNews {
            self.collection.reloadData()
        }
    }
}

extension MyNewsController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(MyNewsCell.self)", for: indexPath) as! MyNewsCell
        cell.titleLabel.text = viewModel.items[indexPath.item].title
        cell.descLabel.text = viewModel.items[indexPath.item].desc
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 120)
    }
}

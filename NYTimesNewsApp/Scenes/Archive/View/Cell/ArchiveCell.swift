//
//  ArchiveCell.swift
//  NYTimesNewsApp
//
//  Created by Rustam Manafov on 23.08.22.
//

import UIKit

protocol ArchiveCellProtocol {
    var imageURL: String { get }
    var titleText: String { get }
    var descText: String { get }
}

class ArchiveCell: UICollectionViewCell {
    
    @IBOutlet private weak var itemImage: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descLabel: UILabel!
    
    func configure(data: ArchiveCellProtocol) {
        titleLabel.text = data.titleText
        descLabel.text = data.descText
        itemImage.loadURL(url: data.imageURL)
    }
}

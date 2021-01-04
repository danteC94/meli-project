//
//  ItemDetailsAttributesCell.swift
//  MeliProject
//
//  Created by dante on 03/01/2021.
//  Copyright © 2021 dante. All rights reserved.
//

import UIKit

class ItemDetailsAttributesCell: UICollectionViewCell {
    struct ViewData {
        let attributes: [Attribute]?
    }

    var viewData: ViewData? {
        didSet {
            self.collectionView.reloadData()
        }
    }

    @IBOutlet weak var collectionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView.register(UINib(nibName: "AtttributeCell", bundle: nil), forCellWithReuseIdentifier: "AtttributeCell")
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }

}

extension ItemDetailsAttributesCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let attributes = self.viewData?.attributes else { return 0 }
        return attributes.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "AtttributeCell", for: indexPath) as? AtttributeCell, let attribute = self.viewData?.attributes?[indexPath.row] else {
            assertionFailure("Could not dequeue cell for row \(indexPath.row) in collection view")
            return UICollectionViewCell()
        }
        cell.viewData = AtttributeCell.ViewData(attributeName: attribute.name, attributeValue: attribute.valueName)
        return cell
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let defaultSize = CGSize(width: (contentView.bounds.size.width / 2) - 42, height: 100)
        return defaultSize
    }

}

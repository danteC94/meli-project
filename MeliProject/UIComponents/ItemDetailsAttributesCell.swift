//
//  ItemDetailsAttributesCell.swift
//  MeliProject
//
//  Created by dante on 03/01/2021.
//  Copyright © 2021 dante. All rights reserved.
//

import UIKit

protocol ItemDetailsAttributesCellDelegate {
    func itemDetailsAttributesCellDidSelectSeeAllAttributes()
}

class ItemDetailsAttributesCell: UICollectionViewCell, ViewDataCompliant {

    // MARK: Structs
    
    struct ViewData {
        let attributes: [Attribute]?
    }

    // MARK: Attributes

    var delegate: ItemDetailsAttributesCellDelegate?
    var viewData: ViewData? {
        didSet {
            self.collectionView.reloadData()
        }
    }

    // MARK: Outlets

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var seeAllAttributes: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!

    // MARK: Events

    @IBAction func seeAllAttributes(_ sender: Any) {
        self.delegate?.itemDetailsAttributesCellDidSelectSeeAllAttributes()
    }

    // MARK: Overrides

    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView.register(UINib(nibName: "AtttributeCell", bundle: nil), forCellWithReuseIdentifier: "AtttributeCell")
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.isScrollEnabled = false
        self.setUpComponentStyles()
    }

    // MARK: Methods

    func setUpComponentStyles() {
        self.title.font = Styles.mainTitleFont
        self.title.textColor = Styles.mainTitleColor
        self.seeAllAttributes.titleLabel?.font = Styles.subtitleFont
        self.seeAllAttributes.titleLabel?.textColor = Styles.buttonColor
    }
}

extension ItemDetailsAttributesCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard self.viewData?.attributes != nil else { return 0 }
        return 3
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
        let collectionViewHeight: CGFloat = 376
        let numberOfCellsToDisplay: CGFloat = 3
        let collectionViewVerticalPadding: CGFloat = 16
        let cellheight = (collectionViewHeight - collectionViewVerticalPadding) / numberOfCellsToDisplay
        return CGSize(width: (contentView.bounds.size.width * 0.6), height: cellheight)
    }
}

//
//  AtttributeCell.swift
//  MeliProject
//
//  Created by dante on 03/01/2021.
//  Copyright © 2021 dante. All rights reserved.
//

import UIKit

class AtttributeCell: UICollectionViewCell {
    struct ViewData {
        let attributeName: String?
        let attributeValue: String?
    }

    var viewData: ViewData? {
        didSet {
            self.attributeName.text = viewData?.attributeName
            self.attributeValue.text = viewData?.attributeValue
        }
    }
    @IBOutlet weak var mainContainer: UIView! {
        didSet {
            mainContainer.layer.borderColor = UIColor.gray.cgColor
            mainContainer.layer.borderWidth = 2
            mainContainer.layer.cornerRadius = 10
        }
    }

    @IBOutlet weak var attributeName: UILabel! {
        didSet {
            attributeName.textAlignment = .center
        }
    }

    @IBOutlet weak var attributeValue: UILabel! {
        didSet {
            attributeValue.textAlignment = .center
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

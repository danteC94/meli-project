//
//  ItemDetailsPriceCell.swift
//  MeliProject
//
//  Created by dante on 03/01/2021.
//  Copyright © 2021 dante. All rights reserved.
//

import UIKit

class ItemDetailsPriceCell: UICollectionViewCell {
    struct ViewData {
        let price: Double
        let installmentsQuantity: Int?
        let installmentsAmount: Int?
    }

    var viewData: ViewData? {
        didSet {
            guard let viewData = viewData else { return }
            self.price.text = "$ \(viewData.price)"
            if let installmentsQuantity = viewData.installmentsQuantity, let installmentsAmount = viewData.installmentsAmount {
                self.installmentsDescription.text = "\(installmentsQuantity) cuotas de \(installmentsAmount)"
            }
        }
    }

    @IBOutlet weak var title: UILabel!

    @IBOutlet weak var price: UILabel!

    @IBOutlet weak var installments: UILabel!


    @IBOutlet weak var installmentsDescription: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

    }
}

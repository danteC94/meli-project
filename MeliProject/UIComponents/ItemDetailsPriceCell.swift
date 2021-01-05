//
//  ItemDetailsPriceCell.swift
//  MeliProject
//
//  Created by dante on 03/01/2021.
//  Copyright © 2021 dante. All rights reserved.
//

import UIKit

public class ItemDetailsPriceCell: UICollectionViewCell {
    struct ViewData {
        let price: Double
        let installmentsQuantity: Int?
        let installmentsAmount: Double?
    }

    var viewData: ViewData? {
        didSet {
            guard let viewData = viewData else { return }
            self.setUpComponentData(viewData: viewData)
        }
    }

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var installments: UILabel!
    @IBOutlet weak var installmentsDescription: UILabel!

    public override func awakeFromNib() {
        super.awakeFromNib()
        self.setUpComponentStyles()
    }

    func setUpComponentStyles() {
        self.title.font = Styles.titleFont
        self.price.font = Styles.titleFont
        self.price.textColor = Styles.titleColor
        self.installments.font = Styles.titleFont
        self.installmentsDescription.font = Styles.bodyFont
        self.installmentsDescription.textColor = Styles.importantDescriptionColor
    }

    func setUpComponentData(viewData: ViewData) {
        self.title.text = "Precio:"
        self.price.text = "$ \(viewData.price)"
        if let installmentsQuantity = viewData.installmentsQuantity, let installmentsAmount = viewData.installmentsAmount {
            self.installments.text = "Cuotas:"
            self.installmentsDescription.text = "\(installmentsQuantity) cuotas de $ \(installmentsAmount)"
        }
    }
}

//
//  ItemDetailsBuyItemCell.swift
//  MeliProject
//
//  Created by dante on 06/01/2021.
//  Copyright © 2021 dante. All rights reserved.
//

import UIKit

protocol ItemDetailsBuyItemCellDelegate {
    func productListVCDidSelectBuyButton(itemURL: String)
}

public class ItemDetailsBuyItemCell: UICollectionViewCell, ViewDataCompliant {

    // MARK: Structs
    
    struct ViewData {
        let availableQuantity: Int?
        let soldQuantity: Int?
        let permalink: String?
    }

    // MARK: Attributes

    var delegate: ItemDetailsBuyItemCellDelegate?
    var viewData: ViewData? {
        didSet {
            guard let viewData = viewData else { return }
            setUpComponentData(viewData: viewData)
        }
    }

    // MARK: Outlets

    @IBOutlet weak var availableQuantity: UILabel!
    @IBOutlet weak var availableQuantityValue: UILabel!
    @IBOutlet weak var soldQuantity: UILabel!
    @IBOutlet weak var soldQuantityValue: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    public override func awakeFromNib() {
        super.awakeFromNib()
        setUpComponentStyles()
    }

    // MARK: Events

    @IBAction func buyButtonClicked(_ sender: Any) {
        guard let itemURL = self.viewData?.permalink else { return }
        self.delegate?.productListVCDidSelectBuyButton(itemURL: itemURL)
    }

    // MARK: Methods

    func setUpComponentStyles() {
        self.buyButton.layer.cornerRadius = 15
        self.buyButton.backgroundColor = Styles.buttonColor
        self.buyButton.titleLabel?.textColor = Styles.buttonWidthBackgroundColor
        self.buyButton.titleLabel?.font = Styles.subtitleFont
        self.availableQuantity.font = Styles.subtitleFont
        self.availableQuantity.textColor = Styles.mainTitleColor
        self.availableQuantityValue.font = Styles.subtitleFont
        self.availableQuantityValue.textColor = Styles.descriptionColor
        self.soldQuantity.font = Styles.subtitleFont
        self.soldQuantity.textColor = Styles.mainTitleColor
        self.soldQuantityValue.font = Styles.subtitleFont
        self.soldQuantityValue.textColor = Styles.descriptionColor
    }

    func setUpComponentData(viewData: ViewData) {
        self.buyButton.setTitle("Comprar producto en Mercado Libre", for: .normal)
        if let availableQuantity = viewData.availableQuantity {
            self.availableQuantity.text = "Cantidad disponible:"
            self.availableQuantityValue.text = String(availableQuantity)
        }
        if let soldQuantity = viewData.soldQuantity {
            self.soldQuantity.text = "Cantidad vendida:"
            self.soldQuantityValue.text = String(soldQuantity)
        }
    }
}

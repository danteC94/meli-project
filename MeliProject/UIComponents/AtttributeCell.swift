//
//  AtttributeCell.swift
//  MeliProject
//
//  Created by dante on 03/01/2021.
//  Copyright © 2021 dante. All rights reserved.
//

import UIKit

public class AtttributeCell: UICollectionViewCell {
    struct ViewData {
        let attributeName: String?
        let attributeValue: String?
    }

    var viewData: ViewData? {
        didSet {
            guard let viewData = viewData else { return }
            self.setUpComponentData(viewData: viewData)
        }
    }
    @IBOutlet weak var mainContainer: UIView!
    @IBOutlet weak var attributeName: UILabel!
    @IBOutlet weak var attributeValue: UILabel!

    public override func awakeFromNib() {
        super.awakeFromNib()
        self.setUpComponentStyles()
    }

    func setUpComponentStyles() {
        self.mainContainer.layer.borderColor = UIColor.gray.cgColor
        self.mainContainer.layer.borderWidth = 2
        self.mainContainer.layer.cornerRadius = 10
        self.attributeName.textAlignment = .center
        self.attributeName.font = Styles.smallTitleFont
        self.attributeName.textColor = Styles.mainTitleColor
        self.attributeValue.textAlignment = .center
        self.attributeValue.font = Styles.descriptionFont
        self.attributeValue.textColor = Styles.descriptionColor
    }

    func setUpComponentData(viewData: ViewData) {
        self.attributeName.text = viewData.attributeName
        self.attributeValue.text = viewData.attributeValue
    }
}

//
//  AtttributeCell.swift
//  MeliProject
//
//  Created by dante on 03/01/2021.
//  Copyright © 2021 dante. All rights reserved.
//

import UIKit

public class AtttributeCell: UICollectionViewCell, ViewDataCompliant {

    // MARK: Structs
    
    struct ViewData {
        let attributeName: String?
        let attributeValue: String?
    }

    // MARK: Attributes

    var viewData: ViewData? {
        didSet {
            guard let viewData = viewData else { return }
            self.setUpComponentData(viewData: viewData)
        }
    }

    // MARK: Outlets

    @IBOutlet weak var mainContainer: UIView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var attributeName: UILabel!
    @IBOutlet weak var attributeValue: UILabel!

    // MARK: Overrides

    public override func awakeFromNib() {
        super.awakeFromNib()
        self.setUpComponentStyles()
    }

    // MARK: Methods

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

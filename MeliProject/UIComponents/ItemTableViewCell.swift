//
//  ItemTableViewCell.swift
//  MeliProject
//
//  Created by dante on 02/01/2021.
//  Copyright © 2021 dante. All rights reserved.
//

import UIKit

public class ItemTableViewCell: UITableViewCell, ViewDataCompliant {

    // MARK: Structs

    struct ViewData {
        let title: String
        let thumbnailURL: String?
        let price: Double
        let freeShipping: Bool?
        let itemCondition: String?
        let imageRequestClosure: ((String, @escaping (UIImage) -> Void) -> Void)?
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
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var shipping: UILabel!
    @IBOutlet weak var condition: UILabel!

    // MARK: Overrides

    public override func awakeFromNib() {
        super.awakeFromNib()
        self.setUpComponentStyles()
    }

    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    // MARK: Methods

    func setUpComponentStyles() {
        self.mainContainer.layer.borderColor = UIColor.blue.cgColor
        self.mainContainer.layer.borderWidth = 0.5
        self.title.font = Styles.smallTitleFont
        self.title.numberOfLines = 4
        self.price.font = Styles.smallTitleFont
        self.price.textColor = Styles.titleColor
        self.shipping.font = Styles.bodyFont
        self.shipping.textColor = Styles.importantDescriptionColor
        self.condition.font = Styles.bodyFont
        self.condition.textColor = Styles.descriptionColor
        self.thumbnail.layer.cornerRadius = 15
    }

    func setUpComponentData(viewData: ViewData) {
        self.title.text = viewData.title
        self.price.text = "$ \(viewData.price)"
        if let freeShipping = viewData.freeShipping, freeShipping {
            self.shipping.text = "Envio Gratis!"
        }
        if let itemCondition = viewData.itemCondition {
            self.condition.text = itemCondition
        }
        guard let thumbnailURL = viewData.thumbnailURL else { return }
        viewData.imageRequestClosure?(thumbnailURL) { [weak self] image in
            guard let self = self else { return }
            self.thumbnail.image = image
        }
    }
}

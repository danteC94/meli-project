//
//  ItemTableViewCell.swift
//  MeliProject
//
//  Created by dante on 02/01/2021.
//  Copyright © 2021 dante. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    struct ViewData {
        let title: String
        let thumbnailURL: String?
        let price: Double
        let freeShipping: Bool?
        let itemCondition: String?
        let imageRequestClosure: ((String, @escaping (UIImage) -> Void) -> Void)?
    }

    var viewData: ViewData? {
        didSet {
            self.title.text = viewData?.title
            if let price = viewData?.price {
                self.price.text = "$ \(price)"
            }
            if let freeShipping = viewData?.freeShipping, freeShipping {
                self.shipping.text = "Envio Gratis!"
            }
            if let itemCondition = viewData?.itemCondition {
                self.condition.text = itemCondition
            }
            guard let thumbnailURL = viewData?.thumbnailURL else { return }
            viewData?.imageRequestClosure?(thumbnailURL) { [weak self] image in
                guard let self = self else { return }
                self.thumbnail.image = image
            }
        }
    }

    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var title: UILabel! {
        didSet {
            title.font = .systemFont(ofSize: 14)
            title.numberOfLines = 4
        }
    }
    @IBOutlet weak var price: UILabel! {
        didSet {
            price.font = .boldSystemFont(ofSize: 20)
        }
    }

    @IBOutlet weak var shipping: UILabel! {
        didSet {
            shipping.font = .systemFont(ofSize: 14)
        }
    }

    @IBOutlet weak var condition: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

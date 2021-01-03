//
//  ItemDetailsHeaderCell.swift
//  MeliProject
//
//  Created by dante on 03/01/2021.
//  Copyright © 2021 dante. All rights reserved.
//

import UIKit

class ItemDetailsHeaderCell: UICollectionViewCell {
    struct ViewData {
        let title: String
        let images: [String]?
        let imageRequestClosure: ((String, @escaping (UIImage) -> Void) -> Void)?
    }

    var viewData: ViewData? {
        didSet {
            guard let image = viewData?.images?.first else { return }
            viewData?.imageRequestClosure?(image) { [weak self] image in
                guard let self = self else { return }
                self.image.image = image
            }
        }
    }

    @IBOutlet weak var image: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

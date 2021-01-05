//
//  ImageCell.swift
//  MeliProject
//
//  Created by dante on 04/01/2021.
//  Copyright © 2021 dante. All rights reserved.
//

import UIKit

class ImageCell: UICollectionViewCell {
    struct ViewData {
        let image: String?
        let imageRequestClosure: ((String, @escaping (UIImage) -> Void) -> Void)?
    }

    var viewData: ViewData? {
        didSet {
            guard let image = viewData?.image else { return }
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

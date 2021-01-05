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
            self.collectionView.reloadData()
        }
    }

    lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        if UIDevice.current.userInterfaceIdiom == .pad {
            layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
        return layout
    }()

    @IBOutlet weak var collectionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView.register(UINib(nibName: "ImageCell", bundle: nil), forCellWithReuseIdentifier: "ImageCell")
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.collectionViewLayout = self.layout
        self.collectionView.isPagingEnabled = true
        self.collectionView.showsHorizontalScrollIndicator = false
    }
}

extension ItemDetailsHeaderCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewData?.images?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as? ImageCell, let image = self.viewData?.images?[indexPath.row] else {
            assertionFailure("Could not dequeue cell for row \(indexPath.row) in collection view")
            return UICollectionViewCell()
        }
        cell.viewData = ImageCell.ViewData(image: image, imageRequestClosure: self.viewData?.imageRequestClosure)
        return cell
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.size.width, height: self.collectionView.frame.size.height)
    }
}

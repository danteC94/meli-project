//
//  ProductDetailsViewController.swift
//  MeliProject
//
//  Created by dante on 30/12/2020.
//  Copyright © 2020 dante. All rights reserved.
//

import UIKit

public class ProductDetailsViewController: UIViewController {
    struct ViewData {
        let item: ItemImmutableModel
        let imageRequestClosure: (String, @escaping (UIImage) -> Void) -> Void
    }

    var viewData: ViewData? {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }

    lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        return layout
    }()


    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            self.collectionView.collectionViewLayout = self.layout
        }
    }



    public override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(UINib(nibName: "ItemDetailsHeaderCell", bundle: nil), forCellWithReuseIdentifier: "ItemDetailsHeaderCell")
        self.collectionView.register(UINib(nibName: "ItemDetailsPriceCell", bundle: nil), forCellWithReuseIdentifier: "ItemDetailsPriceCell")
    }
}

extension ProductDetailsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.viewData?.item != nil ? 2 : 0
    }

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = self.viewData?.item else { return UICollectionViewCell() }
        switch indexPath.section {
        case 0:
            guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "ItemDetailsHeaderCell", for: indexPath) as? ItemDetailsHeaderCell else {
                assertionFailure("Could not dequeue cell for row \(indexPath.row) in collection view")
                return UICollectionViewCell()
            }
            let images: [String]? = item.pictures?.compactMap {picture in
                picture.secureUrl
            }
            cell.viewData = ItemDetailsHeaderCell.ViewData(title: item.title,
                                                           images: images, imageRequestClosure: self.viewData?.imageRequestClosure)
            return cell
        case 1:
            guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "ItemDetailsPriceCell", for: indexPath) as? ItemDetailsPriceCell else {
                assertionFailure("Could not dequeue cell for row \(indexPath.row) in collection view")
                return UICollectionViewCell()
            }
            cell.viewData = ItemDetailsPriceCell.ViewData(price: item.price, installmentsQuantity: 10, installmentsAmount: 100)
            return cell
        default:
            return UICollectionViewCell()
        }
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let defaultSize = CGSize(width: view.bounds.size.width, height: view.bounds.size.height / 6)
        return defaultSize
    }
}

//
//  AttributesViewController.swift
//  MeliProject
//
//  Created by dante on 06/01/2021.
//  Copyright © 2021 dante. All rights reserved.
//

import UIKit

protocol AttributesViewControllerDelegate {
    func AttributesVCDidSelectBackButton()
}

class AttributesViewController: UIViewController, ViewDataCompliant {
    struct ViewData {
        let attributes: [Attribute]?
    }

    var delegate: AttributesViewControllerDelegate?
    var viewData: ViewData? {
        didSet {
            self.collectionView.reloadData()
        }
    }

    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.displayBackButton()
        self.collectionView.register(UINib(nibName: "AtttributeCell", bundle: nil), forCellWithReuseIdentifier: "AtttributeCell")
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }

    func displayBackButton() {
        self.navigationItem.hidesBackButton = true
        let backButton = UIBarButtonItem(title: "Volver",
                                            style: UIBarButtonItem.Style.plain,
                                            target: self,
                                            action: #selector(back(sender:)))
        self.navigationItem.leftBarButtonItem = backButton
    }

    @objc func back(sender: UIBarButtonItem) {
        delegate?.AttributesVCDidSelectBackButton()
    }
}

extension AttributesViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewData?.attributes?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "AtttributeCell", for: indexPath) as? AtttributeCell, let attribute = self.viewData?.attributes?[indexPath.row] else {
            assertionFailure("Could not dequeue cell for row \(indexPath.row) in collection view")
            return UICollectionViewCell()
        }
        cell.viewData = AtttributeCell.ViewData(attributeName: attribute.name, attributeValue: attribute.valueName)
        return cell
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let defaultSize = CGSize(width: (self.view.bounds.size.width / 2), height: 100)
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            let horizontalPadding: CGFloat = 32
            return CGSize(width: self.view.bounds.size.width - horizontalPadding, height: 150)
        case .pad:
            return CGSize(width: self.view.bounds.size.width / 2, height: 150)
        default:
            return defaultSize
        }
    }
}

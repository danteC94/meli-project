//
//  ProductDetailsCoordinator.swift
//  MeliProject
//
//  Created by dante on 30/12/2020.
//  Copyright © 2020 dante. All rights reserved.
//

import UIKit

public class ProductDetailsCoordinator: GenericCoordinatorBase, GenericCoordinator {
    var itemId: String?
    var delegate: MasterDetailRooter?
    let imageRequestClosure: (String, @escaping (UIImage) -> Void) -> Void = { imageURL, completion in
        NetworkManager.requestImage(imageURL: imageURL, success: { retrievedImage in
            DispatchQueue.main.async {
                completion(retrievedImage)
            }
        }, failure: { error in
            guard let error = error else { return }
            print(error)
        })
    }

    init(rootVC: UIViewController, navVC: UINavigationController) {
        super.init(rootViewController: rootVC, navVC: navVC)
    }

    public func start() {
        
    }

    public func displayItemDetails(itemId: String, installments: Installments?, seller: Seller?) {
        let productDetailsVC = self.rootViewController as? ProductDetailsViewController
        NetworkManager.getItemDetails(decodableType: ItemImmutableModel.self,
                                      itemId: itemId,
                                      success: { [weak self] item in
                                        guard let self = self, let item = item as? ItemImmutableModel else { return }
                                        productDetailsVC?.delegate = self
                                        productDetailsVC?.viewData = ProductDetailsViewController.ViewData(item: item,
                                                                                                           installments: installments,
                                                                                                           seller: seller,
                                                                                                           imageRequestClosure: self.imageRequestClosure)
        }, failure: { error in
            print(error)
        })
    }

    func finish() {
        popCoordinator(coordinator: self)
    }
}

extension ProductDetailsCoordinator: ProductDetailsViewControllerDelegate {
    func productDetailsVCDidSelectBackButton() {
        self.delegate?.displayMasterNavigation()
    }
}

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

    init(rootVC: UIViewController, navVC: UINavigationController) {
        super.init(rootViewController: rootVC, navVC: navVC)
    }

    public func start() {
        
    }

    public func displayItemDetails(itemId: String) {
        let productDetailsVC = self.rootViewController as? ProductDetailsViewController
        NetworkManager.getItemDetails(decodableType: ItemImmutableModel.self,
                                      itemId: itemId,
                                      success: { item in
                                        guard let item = item as? ItemImmutableModel else { return }
                                        productDetailsVC?.viewData = ProductDetailsViewController.ViewData(item: item)
        }, failure: { error in
            print(error)
        })
    }

    func finish() {
        popCoordinator(coordinator: self)
    }
}

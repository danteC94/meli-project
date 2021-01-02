//
//  ProductListCoordinator.swift
//  MeliProject
//
//  Created by dante on 30/12/2020.
//  Copyright © 2020 dante. All rights reserved.
//

import UIKit

public class ProductListCoordinator: GenericCoordinatorBase, GenericCoordinator {
    var delegate: MasterDetailRooter?

    init(rootVC: UIViewController, navVC: UINavigationController) {
        super.init(rootViewController: rootVC, navVC: navVC)
    }

    public func start() {
        let productListViewController = self.rootViewController as? ProductListViewController
        productListViewController?.delegate = self
        NetworkManager.searchItems(decodableType: ItemsImmutableModel.self,
                                   pageSize: 20,
                                   paginated: true,
                                   query: "Motorola%20G6",
                                   category: nil,
                                   success: { items in
                                    print(items)
                                    guard let items = (items as? ItemsImmutableModel)?.results else { return }
                                    productListViewController?.viewData = ProductListViewController.ViewData(items: items)
        },
                                   failure: { error in
                                    print(error)
        })
    }

    func finish() {
        self.popCoordinator(coordinator: self)
    }
}

extension ProductListCoordinator: ProductListViewControllerDelegate {
    func productListVCDidSelectItem(itemId: String) {
        self.delegate?.displayDetailNavigation(itemId: itemId)
    }
}

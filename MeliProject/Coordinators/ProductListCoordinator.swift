//
//  ProductListCoordinator.swift
//  MeliProject
//
//  Created by dante on 30/12/2020.
//  Copyright © 2020 dante. All rights reserved.
//

import UIKit
import class NetworkLayer.NetworkManager

public class ProductListCoordinator: GenericCoordinatorBase, GenericCoordinator {

    // MARK: Attributes
    
    var imageRequestClosure: ((String, @escaping (UIImage) -> Void) -> Void)?
    var delegate: MasterDetailRooter?

    // MARK: Methods
    
    init(rootVC: UIViewController, navVC: UINavigationController) {
        super.init(rootViewController: rootVC, navVC: navVC)
    }

    public func start() {
        let productListViewController = self.rootViewController as? ProductListViewController
        productListViewController?.delegate = self
    }

    func finish() {
        self.popCoordinator(coordinator: self)
    }

    func searchItems(query: String?, category: String?, newSearch: Bool, completion: @escaping ([ItemImmutableModel]) -> Void) {
        NetworkManager.searchItems(decodableType: ItemsImmutableModel.self,
                                   pageSize: 20,
                                   paginated: true,
                                   newSearch: newSearch,
                                   query: query,
                                   category: category,
                                   success: { items in
                                    print(items)
                                    guard let items = (items as? ItemsImmutableModel)?.results else { return }
                                    completion(items)
        },
                                   failure: { error in
                                    guard let error = error else { return }
                                    print(error)
        })
    }
}

extension ProductListCoordinator: ProductListViewControllerDelegate {
    func productListVCDidSearch(query: String) {
        self.searchItems(query: query, category: nil, newSearch: true, completion: { [weak self] items in
            guard let self = self , let productListViewController = self.rootViewController as? ProductListViewController else { return }
            productListViewController.viewData = ProductListViewController.ViewData(items: items, imageRequestClosure: self.imageRequestClosure)
        })
    }

    func productListVCDidSelectItem(itemId: String, installments: Installments?, seller: Seller?) {
        self.delegate?.displayDetailNavigation(itemId: itemId, installments: installments, seller: seller)
    }

    func productListVCDidReachLastElement(query: String, itemsDisplayed: [ItemImmutableModel]) {
        self.searchItems(query: query, category: nil, newSearch: false, completion: { [weak self] newItems in
            guard let self = self , let productListViewController = self.rootViewController as? ProductListViewController else { return }
            var items = itemsDisplayed
            items.append(contentsOf: newItems)
            productListViewController.viewData = ProductListViewController.ViewData(items: items, imageRequestClosure: self.imageRequestClosure)
        })
    }
}

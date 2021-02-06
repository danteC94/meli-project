//
//  ProductDetailsCoordinator.swift
//  MeliProject
//
//  Created by dante on 30/12/2020.
//  Copyright © 2020 dante. All rights reserved.
//

import UIKit
import class NetworkLayer.NetworkManager

public class ProductDetailsCoordinator: GenericCoordinatorBase, GenericCoordinator {

    // MARK: Attributes

    var itemId: String?
    var delegate: MasterDetailRooter?
    var imageRequestClosure: ((String, @escaping (UIImage) -> Void) -> Void)?

    // MARK: Methods

    init(rootVC: UIViewController, navVC: UINavigationController) {
        super.init(rootViewController: rootVC, navVC: navVC)
    }

    public func start() {}

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
            guard let error = error else { return }
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

    func productDetailsVCDidSelectSeeAllAttributes(attributes: [Attribute]) {
        // Hide Master View Controller so that the details view
        // controller can be displayed using the full screen on iPad.
        self.navVC.splitViewController?.preferredDisplayMode = .primaryHidden
        let attributesVC = AttributesViewController()
        _ = attributesVC.view
        attributesVC.delegate = self
        attributesVC.viewData = AttributesViewController.ViewData(attributes: attributes)
        self.navVC.pushViewController(attributesVC, animated: true)
    }

    func productDetailsVCDidSelectBuyButton(itemURL: String) {
        guard let itemURL = URL(string: itemURL) else { return }
        let webVC = WebViewController()
        _ = webVC.view
        webVC.viewData = WebViewController.ViewData(url: itemURL)
        self.navVC.present(webVC, animated: true, completion: nil)
    }
}

extension ProductDetailsCoordinator: AttributesViewControllerDelegate {
    func AttributesVCDidSelectBackButton() {
        // Show Master View Controller on iPad.
        self.navVC.splitViewController?.preferredDisplayMode = .allVisible
        self.navVC.popViewController(animated: true)
    }
}

//
//  ProductDetailsCoordinator.swift
//  MeliProject
//
//  Created by dante on 30/12/2020.
//  Copyright © 2020 dante. All rights reserved.
//

import UIKit

public class ProductDetailsCoordinator: GenericCoordinatorBase, GenericCoordinator {
    init(rootVC: UIViewController, navVC: UINavigationController) {
        super.init(rootViewController: rootVC, navVC: navVC)
    }

    public func start() {
        let detailVC = ProductDetailsViewController()
        self.navVC.pushViewController(detailVC, animated: true)
    }

    func finish() {
        popCoordinator(coordinator: self)
    }
}
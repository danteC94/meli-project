//
//  ProductListCoordinator.swift
//  MeliProject
//
//  Created by dante on 30/12/2020.
//  Copyright © 2020 dante. All rights reserved.
//

import UIKit

public class ProductListCoordinator: GenericCoordinatorBase, GenericCoordinator {
    init(rootVC: UIViewController, navVC: UINavigationController) {
        super.init(rootViewController: rootVC, navVC: navVC)
    }

    public func start() {}

    func finish() {
        self.popCoordinator(coordinator: self)
    }
}

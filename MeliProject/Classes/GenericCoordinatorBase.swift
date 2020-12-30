//
//  GenericCoordinatorBase.swift
//  MeliProject
//
//  Created by dante on 30/12/2020.
//  Copyright © 2020 dante. All rights reserved.
//

import UIKit

public class GenericCoordinatorBase: CoordinatorBase {
    var navVC: UINavigationController
    var rootViewController: UIViewController

    init(rootViewController: UIViewController, navVC: UINavigationController) {
        self.navVC = navVC
        self.rootViewController = rootViewController
        super.init()
    }

    func pushCoordinator(coordinator: inout GenericCoordinatorBase) {
        super.pushCoordinator(coordinator: &coordinator, navVC: self.navVC, rootVC: self.rootViewController)
    }

    func popCoordinator(coordinator: GenericCoordinatorBase) {
        super.popCoordinator(coordinator: coordinator, navVC: self.navVC)
    }
}

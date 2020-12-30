//
//  MainCoordinatorBase.swift
//  MeliProject
//
//  Created by dante on 30/12/2020.
//  Copyright © 2020 dante. All rights reserved.
//

import UIKit

public class MainCoordinatorBase: CoordinatorBase {
    var masterNavVC: UINavigationController
    var detailNavVC: UINavigationController
    var masterRootVC: UIViewController
    var detailRootVC: UIViewController

    init(masterNavVC: UINavigationController,
         detailNavVC: UINavigationController,
         masterRootVC: UIViewController,
         detailRootVC: UIViewController) {
        self.masterNavVC = masterNavVC
        self.detailNavVC = detailNavVC
        self.masterRootVC = masterRootVC
        self.detailRootVC = detailRootVC
        super.init()
    }

    func pushMasterCoordinator(coordinator: inout GenericCoordinatorBase) {
        super.pushCoordinator(coordinator: &coordinator, navVC: masterNavVC, rootVC: masterRootVC)
    }

    func pushDetailCoordinator(coordinator: inout GenericCoordinatorBase) {
        super.pushCoordinator(coordinator: &coordinator, navVC: detailNavVC, rootVC: detailRootVC)
    }

    func popMasterCoordinator(coordinator: inout GenericCoordinatorBase) {
        super.popCoordinator(coordinator: coordinator, navVC: masterNavVC)
    }

    func popDetailCoordinator(coordinator: inout GenericCoordinatorBase) {
        super.popCoordinator(coordinator: coordinator, navVC: detailNavVC)
    }
}

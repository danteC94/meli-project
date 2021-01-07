//
//  MainCoordinatorBase.swift
//  MeliProject
//
//  Created by dante on 30/12/2020.
//  Copyright © 2020 dante. All rights reserved.
//

import UIKit

/**
 The base class which handles the navigation on the main coordinator.

 This is only for the main coordinator which has subtle differences
 with generic coordinators on it's navigation flow.
*/

public class MainCoordinatorBase: CoordinatorBase {

    // MARK: Attributes
    
    var masterNavVC: UINavigationController
    var detailNavVC: UINavigationController
    var masterRootVC: UIViewController
    var detailRootVC: UIViewController

    // MARK: Methods
    
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
        super.pushCoordinator(coordinator: &coordinator, rootVC: masterRootVC)
    }

    func pushDetailCoordinator(coordinator: inout GenericCoordinatorBase) {
        super.pushCoordinator(coordinator: &coordinator, rootVC: detailRootVC)
    }

    func popMasterCoordinator(coordinator: inout GenericCoordinatorBase) {
        super.popCoordinator(coordinator: coordinator)
    }

    func popDetailCoordinator(coordinator: inout GenericCoordinatorBase) {
        super.popCoordinator(coordinator: coordinator)
    }
}

//
//  GenericCoordinatorBase.swift
//  MeliProject
//
//  Created by dante on 30/12/2020.
//  Copyright © 2020 dante. All rights reserved.
//

import UIKit

/**
 The base class which handles the navigation between coordinators.

 Every generic coordinator should inherit from this class.
*/

public class GenericCoordinatorBase: CoordinatorBase {

    // MARK: Attributes
    
    var navVC: UINavigationController
    var rootViewController: UIViewController

    // MARK: Methods
    
    init(rootViewController: UIViewController, navVC: UINavigationController) {
        self.navVC = navVC
        self.rootViewController = rootViewController
        super.init()
    }

    func pushCoordinator(coordinator: inout GenericCoordinatorBase) {
        super.pushCoordinator(coordinator: &coordinator, rootVC: self.rootViewController)
    }

    func popCoordinator(coordinator: GenericCoordinatorBase) {
        super.popCoordinator(coordinator: coordinator)
    }
}

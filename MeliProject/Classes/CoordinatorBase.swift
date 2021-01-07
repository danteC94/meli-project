//
//  CoordinatorBase.swift
//  MeliProject
//
//  Created by dante on 30/12/2020.
//  Copyright © 2020 dante. All rights reserved.
//

import UIKit

/**
 The base class which handles the navigation between coordinators.

 Every coordinator should inherit from this class in order to be able
 to push new coordinators using the same navigation controller. Also it
 gives an easy way to pop coordinators.
*/

public class CoordinatorBase {

    // MARK: Attributes
    
    weak var parentCoordinator: CoordinatorBase?
    var childCoordinators: [GenericCoordinatorBase]

    // MARK: Methods
    
    init() {
        self.childCoordinators = [GenericCoordinatorBase]()
    }

    /// Add a new coordinator to the children stack and also
    /// push it's root View Controller.
    func pushCoordinator(coordinator: inout GenericCoordinatorBase,
                         rootVC: UIViewController,
                         animated: Bool = true) {
        self.childCoordinators.append(coordinator)
        coordinator.parentCoordinator = self
        coordinator.navVC.pushViewController(rootVC, animated: animated)
    }

    /// Removes a coordinator with all it's View Controllers.
    func popCoordinator(coordinator: GenericCoordinatorBase,
                        animated: Bool = true) {
        guard let coordinatorIndex = self.childCoordinators.firstIndex(where: { $0 === coordinator }) else { return }
        self.popCoordinatorRootVC(coordinator: coordinator, animated: animated)
        self.childCoordinators.remove(at: coordinatorIndex)
    }

    /// Removes the View Controllers within a coordinator.
    func popCoordinatorRootVC(coordinator: GenericCoordinatorBase,
                              animated: Bool = true) {
        coordinator.navVC.popToViewController(coordinator.rootViewController, animated: animated)
        coordinator.navVC.popViewController(animated: animated)
    }
}

extension CoordinatorBase: Equatable {
    public static func == (lhs: CoordinatorBase, rhs: CoordinatorBase) -> Bool {
        return (lhs.parentCoordinator == rhs.parentCoordinator && lhs.childCoordinators == rhs.childCoordinators)
    }
}

//
//  CoordinatorBase.swift
//  MeliProject
//
//  Created by dante on 30/12/2020.
//  Copyright © 2020 dante. All rights reserved.
//

import UIKit

public class CoordinatorBase {
    var parentCoordinator: CoordinatorBase?
    var childCoordinators: [GenericCoordinatorBase]

    init() {
        self.childCoordinators = [GenericCoordinatorBase]()
    }

    func pushCoordinator(coordinator: inout GenericCoordinatorBase,
                         navVC: UINavigationController,
                         rootVC: UIViewController,
                         animated: Bool = true) {
        self.childCoordinators.append(coordinator)
        coordinator.parentCoordinator = self
        navVC.pushViewController(rootVC, animated: animated)
    }

    func popCoordinator(coordinator: GenericCoordinatorBase,
                        navVC: UINavigationController,
                        animated: Bool = true) {
        guard let coordinatorIndex = self.childCoordinators.firstIndex(where: { $0 === coordinator }) else { return }
        guard navVC == coordinator.navVC else { return }
        self.popCoordinatorRootVC(coordinator: coordinator, navVC: navVC, animated: animated)
        self.childCoordinators.remove(at: coordinatorIndex)
    }

    func popCoordinatorRootVC(coordinator: GenericCoordinatorBase,
                              navVC: UINavigationController,
                              animated: Bool = true) {
        navVC.popToViewController(coordinator.rootViewController, animated: animated)
        navVC.popViewController(animated: animated)
    }
}

extension CoordinatorBase: Equatable {
    public static func == (lhs: CoordinatorBase, rhs: CoordinatorBase) -> Bool {
        return (lhs.parentCoordinator == rhs.parentCoordinator && lhs.childCoordinators == rhs.childCoordinators)
    }
}

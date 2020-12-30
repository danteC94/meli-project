//
//  AppCoordinator.swift
//  MeliProject
//
//  Created by dante on 30/12/2020.
//  Copyright © 2020 dante. All rights reserved.
//

import UIKit

public class AppCoordinator: MainCoordinatorBase, MainCoordinator, UISplitViewControllerDelegate {
    let splitViewController: UISplitViewController
    let window: UIWindow

    init(window: UIWindow, splitVC: UISplitViewController) {
        self.window = window
        self.splitViewController = splitVC

        let masterNavVC = UINavigationController()
        let detailNavVC = UINavigationController()
        let masterRootVC = ProductListViewController()
        let detailRootVC = ProductDetailsViewController()

        super.init(masterNavVC: masterNavVC,
                   detailNavVC: detailNavVC,
                   masterRootVC: masterRootVC,
                   detailRootVC: detailRootVC)
    }

    public func start() {
        self.setUpSplitViewController(masterVC: self.masterNavVC, detailVC: self.detailNavVC)

        self.showWindow(window: self.window, with: self.splitViewController)

        self.startMainCoordinators()
    }

    func setUpSplitViewController(masterVC: UINavigationController, detailVC: UINavigationController) {
        self.splitViewController.preferredPrimaryColumnWidthFraction = 1/3
        self.splitViewController.viewControllers = [masterVC, detailVC]
        self.splitViewController.delegate = self
    }

    func showWindow(window: UIWindow, with rootViewController: UIViewController) {
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }

    func startMainCoordinators() {
        var masterCoordinator: GenericCoordinatorBase = ProductListCoordinator(rootVC: masterRootVC, navVC: masterNavVC)
        self.pushMasterCoordinator(coordinator: &masterCoordinator)
        var detailCoordinator: GenericCoordinatorBase = ProductDetailsCoordinator(rootVC: detailRootVC, navVC: detailNavVC)
        self.pushDetailCoordinator(coordinator: &detailCoordinator)
    }
}


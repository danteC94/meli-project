//
//  AppCoordinator.swift
//  MeliProject
//
//  Created by dante on 30/12/2020.
//  Copyright © 2020 dante. All rights reserved.
//

import UIKit

protocol MasterDetailRooter {
    func displayMasterNavigation()
    func displayDetailNavigation(itemId: String, installments: Installments?)
}

public class AppCoordinator: MainCoordinatorBase, MainCoordinator {
    var productListCoordinator: ProductListCoordinator? { return self.childCoordinators.first as? ProductListCoordinator}
    var productDetailsCoordinator: ProductDetailsCoordinator? { return self.childCoordinators.last as? ProductDetailsCoordinator}
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
        self.setUpNetworkSession(locale: Locale.current)
        self.startMainCoordinators()
    }

    func setUpSplitViewController(masterVC: UINavigationController, detailVC: UINavigationController) {
        self.splitViewController.preferredPrimaryColumnWidthFraction = 1
        self.splitViewController.preferredDisplayMode = .allVisible
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
        self.productListCoordinator?.delegate = self
        self.productListCoordinator?.start()

        var detailCoordinator: GenericCoordinatorBase = ProductDetailsCoordinator(rootVC: detailRootVC, navVC: detailNavVC)
        self.pushDetailCoordinator(coordinator: &detailCoordinator)
        self.productDetailsCoordinator?.start()
    }

    func setUpNetworkSession(locale: Locale) {
        switch locale.regionCode {
        case "AR":
            NetworkManager.setUpSession(session: .network, location: .Argentina)
        case "BR":
            NetworkManager.setUpSession(session: .network, location: .Brasil)
        case "CL":
            NetworkManager.setUpSession(session: .network, location: .Chile)
        case "MX":
            NetworkManager.setUpSession(session: .network, location: .Mexico)
        case "CO":
            NetworkManager.setUpSession(session: .network, location: .Colombia)
        default:
            NetworkManager.setUpSession(session: .network, location: .Argentina)
        }
    }
}

extension AppCoordinator: UISplitViewControllerDelegate {}

extension AppCoordinator: MasterDetailRooter {
    func displayMasterNavigation() {

    }

    func displayDetailNavigation(itemId: String, installments: Installments?) {
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            self.splitViewController.showDetailViewController(self.detailRootVC, sender: nil)
            (self.childCoordinators.last as? ProductDetailsCoordinator)?.displayItemDetails(itemId: itemId, installments: installments)
        case .pad:
            (self.childCoordinators.last as? ProductDetailsCoordinator)?.displayItemDetails(itemId: itemId, installments: installments)
        default:
            break
        }
    }
}

//
//  AppCoordinator.swift
//  MeliProject
//
//  Created by dante on 30/12/2020.
//  Copyright © 2020 dante. All rights reserved.
//

import UIKit

/**
 An object that adopts the MasterDetailRooter protocol is responsible for providing
 the navigation between master and details Navigation Controllers.

 Since the Master and Details Coordinators handles the master and details navigations respectively, they are never removed, thus this navigation can not be handled by removing coordinators.
*/
protocol MasterDetailRooter {
    func displayMasterNavigation()
    func displayDetailNavigation(itemId: String, installments: Installments?, seller: Seller?)
}

public class AppCoordinator: MainCoordinatorBase, MainCoordinator {

    // MARK: Attributes

    let window: UIWindow
    let splitViewController: UISplitViewController
    var productListCoordinator: ProductListCoordinator? { return self.childCoordinators.first as? ProductListCoordinator}
    var productDetailsCoordinator: ProductDetailsCoordinator? { return self.childCoordinators.last as? ProductDetailsCoordinator }
    /// This closure is intended to avoid making network request from UI components.
    let imageRequestClosure: (String, @escaping (UIImage) -> Void) -> Void = { imageURL, completion in
        NetworkManager.requestImage(imageURL: imageURL, success: { retrievedImage in
            DispatchQueue.main.async {
                completion(retrievedImage)
            }
        }, failure: { error in
            guard let error = error else { return }
            print(error)
        })
    }

    // MARK: Methods

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
        self.productListCoordinator?.imageRequestClosure = self.imageRequestClosure
        self.productListCoordinator?.start()

        var detailCoordinator: GenericCoordinatorBase = ProductDetailsCoordinator(rootVC: detailRootVC, navVC: detailNavVC)
        self.pushDetailCoordinator(coordinator: &detailCoordinator)
        self.productDetailsCoordinator?.delegate = self
        self.productDetailsCoordinator?.imageRequestClosure = self.imageRequestClosure
        self.productDetailsCoordinator?.start()
    }

    /**
     Starts the NetworkManager session with the specified location.

     - Parameter locale: The locale to be used to start the session.
    */
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
        (self.splitViewController.viewControllers.first as? UINavigationController)?.popToRootViewController(animated: true)
    }

    func displayDetailNavigation(itemId: String, installments: Installments?, seller: Seller?) {
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            self.splitViewController.showDetailViewController(self.detailNavVC, sender: nil)
            (self.childCoordinators.last as? ProductDetailsCoordinator)?.displayItemDetails(itemId: itemId, installments: installments, seller: seller)
        case .pad:
            (self.childCoordinators.last as? ProductDetailsCoordinator)?.displayItemDetails(itemId: itemId, installments: installments, seller: seller)
        default:
            break
        }
    }
}

//
//  AppCoordinatorTests.swift
//  MeliProjectTests
//
//  Created by dante on 30/12/2020.
//  Copyright © 2020 dante. All rights reserved.
//

import XCTest
@testable import class MeliProject.AppCoordinator

class AppCoordinatorTests: XCTestCase, TestBase {
    var sut: AppCoordinator!
    var window = UIWindow()
    var splitVC = UISplitViewController()

    override func setUp() {
        self.sut = AppCoordinator(window: window, splitVC: splitVC)
        super.setUp()
    }

    override func tearDown() {
        self.sut = nil
        super.tearDown()
    }

    func testSetUpSplitViewController() {
        let masterVC = UINavigationController()
        let detailVC = UINavigationController()
        sut.setUpSplitViewController(masterVC: masterVC, detailVC: detailVC)

        XCTAssertEqual(sut.splitViewController.preferredPrimaryColumnWidthFraction, 1/3)
        XCTAssertEqual(sut.splitViewController.preferredDisplayMode, .primaryOverlay)
        XCTAssertEqual(sut.splitViewController.viewControllers.count, 2)
        XCTAssertTrue(sut.splitViewController.viewControllers.contains(masterVC))
        XCTAssertTrue(sut.splitViewController.viewControllers.contains(detailVC))
        XCTAssertTrue(sut.splitViewController.delegate === sut)
    }

    func testStartMainCoordinatorsCreatesTheCorrectCoordinatorsAndViewControllers() {
        sut.startMainCoordinators()

        let masterCoordinator = sut.childCoordinators.first
        let detailCoordinator = sut.childCoordinators.last

        XCTAssertEqual(sut.childCoordinators.count, 2)
        XCTAssertEqual(masterCoordinator!.navVC, sut.masterNavVC)
        XCTAssertEqual(detailCoordinator!.navVC, sut.detailNavVC)
        XCTAssertEqual(masterCoordinator!.navVC.children.count, 1)
        XCTAssertEqual(detailCoordinator!.navVC.children.count, 1)
        XCTAssertEqual(masterCoordinator!.rootViewController, sut.masterRootVC)
        XCTAssertEqual(detailCoordinator!.rootViewController, sut.detailRootVC)
    }
}

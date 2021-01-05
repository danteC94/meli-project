//
//  ProductListViewControllerTests.swift
//  MeliProjectTests
//
//  Created by dante on 02/01/2021.
//  Copyright © 2021 dante. All rights reserved.
//

import XCTest
@testable import class MeliProject.ProductListViewController
@testable import struct MeliProject.ItemImmutableModel

class ProductListViewControllerTests: XCTestCase, TestBase {
    var sut: ProductListViewController!
    var tableView: UITableView! { return self.sut.tableView }
    var dataSource: UITableViewDataSource! { return self.sut.tableView!.dataSource }

    override func setUp() {
        super.setUp()
        self.sut = ProductListViewController()
        _ = sut.view
    }

    override func tearDown() {
        self.sut = nil
        super.tearDown()
    }

    func testLoadProductListViewControllerWithoutData() {
        givenNoData()

        XCTAssertEqual(dataSource.tableView(tableView!, numberOfRowsInSection: 0), 0)
    }

    func testLoadProductListViewControllerWithTwoItems() {
        givenTwoItems()

        XCTAssertEqual(dataSource.tableView(tableView!, numberOfRowsInSection: 0), 2)
    }

    // MARK: Given

    func givenNoData() {
        self.sut.viewData = ProductListViewController.ViewData(items: [], imageRequestClosure: {_,_ in })
    }

    func givenTwoItems() {
        let item1 = ItemImmutableModel(id: "MLA899102656",
                                       siteId: "MLA",
                                       title: "Celular Motorola G6 Play Dorado",
                                       subtitle: nil,
                                       sellerId: 155913199,
                                       seller: nil,
                                       price: 27900,
                                       basePrice: 27900,
                                       currencyId: "ARS",
                                       initialQuantity: 1,
                                       availableQuantity: 1,
                                       saleTerms: nil,
                                       condition: nil,
                                       thumbnail: nil,
                                       secureThumbnail: nil,
                                       pictures: nil,
                                       acceptsMercadopago: nil,
                                       installments: nil,
                                       shipping: nil,
                                       sellerAddress: nil,
                                       attributes: nil)
        let item2 = item1

        self.sut.viewData = ProductListViewController.ViewData(items: [item1, item2], imageRequestClosure: {_,_ in })
    }
}

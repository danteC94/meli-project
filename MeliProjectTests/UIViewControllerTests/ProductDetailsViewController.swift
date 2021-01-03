//
//  ProductDetailsViewController.swift
//  MeliProjectTests
//
//  Created by dante on 03/01/2021.
//  Copyright © 2021 dante. All rights reserved.
//

import XCTest
@testable import class MeliProject.ProductDetailsViewController
@testable import struct MeliProject.ItemImmutableModel

class ProductDetailsViewControllerTests: XCTestCase, TestBase {
    var sut: ProductDetailsViewController!
    var collectionView: UICollectionView! { return self.sut.collectionView }
    var dataSource: UICollectionViewDataSource! { return self.sut.collectionView!.dataSource }

    override func setUp() {
        super.setUp()
        self.sut = ProductDetailsViewController()
        _ = sut.view
    }

    override func tearDown() {
        self.sut = nil
        super.tearDown()
    }

    func testLoadProductDetailsViewControllerWithoutData() {
        givenNoData()

        XCTAssertEqual(dataSource.numberOfSections?(in: collectionView!), 0)
    }

    func testLoadProductDetailsViewControllerWithAnItem() {
        givenOneItems()

        XCTAssertEqual(dataSource.numberOfSections?(in: collectionView!), 2)
    }

    // MARK: Given

    func givenNoData() {
        self.sut.viewData = nil
    }

    func givenOneItems() {
        let item = ItemImmutableModel(id: "MLA899102656",
                                       siteId: "MLA",
                                       title: "Celular Motorola G6 Play Dorado",
                                       subtitle: nil,
                                       sellerId: 155913199,
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

        self.sut.viewData = ProductDetailsViewController.ViewData(item: item, imageRequestClosure: {_,_ in })
    }
}

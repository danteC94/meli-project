//
//  ItemDetailsBuyItemCellTests.swift
//  MeliProjectTests
//
//  Created by dante on 06/01/2021.
//  Copyright © 2021 dante. All rights reserved.
//

import XCTest
@testable import class MeliProject.ItemDetailsBuyItemCell
import struct MeliProject.Styles

class ItemDetailsBuyItemCellTests: XCTestCase, TestBase {
    var sut: ItemDetailsBuyItemCell!

    override func setUp() {
        super.setUp()
        sut = UINib.getNib(for: ItemDetailsBuyItemCell.self) as? ItemDetailsBuyItemCell
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testSetUpComponentStyles() {
        self.givenAnInitializedComponent()

        XCTAssertEqual(sut.buyButton.layer.cornerRadius, 15)
        XCTAssertEqual(sut.buyButton.backgroundColor, Styles.buttonColor)
        XCTAssertEqual(sut.availableQuantity.font, Styles.smallTitleFont)
        XCTAssertEqual(sut.availableQuantity.textColor, Styles.mainTitleColor)
        XCTAssertEqual(sut.availableQuantityValue.font , Styles.subtitleFont)
        XCTAssertEqual(sut.availableQuantityValue.textColor, Styles.descriptionColor)
        XCTAssertEqual(sut.soldQuantity.font, Styles.smallTitleFont)
        XCTAssertEqual(sut.soldQuantity.textColor , Styles.mainTitleColor)
        XCTAssertEqual(sut.soldQuantityValue.font, Styles.subtitleFont)
        XCTAssertEqual(sut.soldQuantityValue.textColor, Styles.descriptionColor)
        XCTAssertEqual(sut.buyButton.titleLabel?.font , Styles.bodyFont)
        XCTAssertEqual(sut.buyButton.titleLabel?.textColor, Styles.buttonWidthBackgroundColor)
    }

    func testSetRatingStarsWithTwoAndAHalfStars() {
        self.givenAnInitializedComponentWithData()

        XCTAssertEqual(sut.buyButton.titleLabel?.text, "Comprar producto en Mercado Libre")
        XCTAssertEqual(sut.availableQuantity.text, "Cantidad disponible:")
        XCTAssertEqual(sut.availableQuantityValue.text, String(5))
        XCTAssertEqual(sut.soldQuantity.text, "Cantidad de ventas de este producto:")
        XCTAssertEqual(sut.soldQuantityValue.text, String(5))
    }

    // MARK: Given

    func givenAnInitializedComponent() {
        self.sut.setUpComponentStyles()
    }

    func givenAnInitializedComponentWithData() {
        let viewData = ItemDetailsBuyItemCell.ViewData(availableQuantity: 5, soldQuantity: 5, permalink: nil)
        self.sut.setUpComponentData(viewData: viewData)
    }
}
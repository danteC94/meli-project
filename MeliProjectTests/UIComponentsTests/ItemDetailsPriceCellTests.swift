//
//  ItemDetailsPriceCellTests.swift
//  MeliProjectTests
//
//  Created by dante on 05/01/2021.
//  Copyright © 2021 dante. All rights reserved.
//

import XCTest
@testable import class MeliProject.ItemDetailsPriceCell
import struct MeliProject.Styles

class ItemDetailsPriceCellTests: XCTestCase, TestBase {
    var sut: ItemDetailsPriceCell!

    override func setUp() {
        super.setUp()
        sut = UINib.getNib(for: ItemDetailsPriceCell.self) as? ItemDetailsPriceCell
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testSetUpComponentStyles() {
        self.givenAnInitializedComponent()

        XCTAssertEqual(sut.title.font, Styles.titleFont)
        XCTAssertEqual(sut.price.font, Styles.titleFont)
        XCTAssertEqual(sut.price.textColor, Styles.titleColor)
        XCTAssertEqual(sut.installments.font, Styles.titleFont)
        XCTAssertEqual(sut.installmentsDescription.font, Styles.bodyFont)
        XCTAssertEqual(sut.installmentsDescription.textColor, Styles.importantDescriptionColor)
    }

    func testSetUpComponentData() {
        self.givenAnInitializedComponentWithData()

        XCTAssertEqual(sut.title.text, "Precio:")
        XCTAssertEqual(sut.price.text, "$ \(Double(27900))")
        XCTAssertEqual(sut.installments.text, "Cuotas:")
        XCTAssertEqual(sut.installmentsDescription.text, "16 cuotas de $ \(Double(2977.98))")
    }

    // MARK: Given

    func givenAnInitializedComponent() {
        self.sut.setUpComponentStyles()
    }

    func givenAnInitializedComponentWithData() {
        let viewData = ItemDetailsPriceCell.ViewData(price: Double(27900),
                                                     installmentsQuantity: 16,
                                                     installmentsAmount: 2977.98)
        self.sut.setUpComponentData(viewData: viewData)
    }
}

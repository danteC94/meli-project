//
//  ItemTableViewCellTests.swift
//  MeliProjectTests
//
//  Created by dante on 05/01/2021.
//  Copyright © 2021 dante. All rights reserved.
//

import XCTest
@testable import class MeliProject.ItemTableViewCell
import struct MeliProject.Styles

class ItemTableViewCellTests: XCTestCase, TestBase {
    var sut: ItemTableViewCell!

    override func setUp() {
        super.setUp()
        sut = UINib.getNib(for: ItemTableViewCell.self) as? ItemTableViewCell
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testSetUpComponentStyles() {
        self.givenAnInitializedComponent()

        XCTAssertEqual(sut.title.font, Styles.smallTitleFont)
        XCTAssertEqual(sut.title.numberOfLines, 4)
        XCTAssertEqual(sut.price.font, Styles.smallTitleFont)
        XCTAssertEqual(sut.price.textColor, Styles.titleColor)
        XCTAssertEqual(sut.shipping.font, Styles.bodyFont)
        XCTAssertEqual(sut.shipping.textColor, Styles.importantDescriptionColor)
        XCTAssertEqual(sut.condition.font, Styles.bodyFont)
        XCTAssertEqual(sut.condition.textColor, Styles.descriptionColor)
    }

    func testSetUpComponentData() {
        self.givenAnInitializedComponentWithData()

        XCTAssertEqual(sut.title.text, "Celular Motorola G6 Play Dorado")
        XCTAssertEqual(sut.price.text, "$ \(Double(27900))")
        XCTAssertEqual(sut.shipping.text, "Envio Gratis!")
        XCTAssertEqual(sut.condition.text, "Usado")
    }

    // MARK: Given

    func givenAnInitializedComponent() {
        self.sut.setUpComponentStyles()
    }

    func givenAnInitializedComponentWithData() {
        let viewData = ItemTableViewCell.ViewData(title: "Celular Motorola G6 Play Dorado",
                                                  thumbnailURL: "http://http2.mlstatic.com/D_687655-MLA44021170272_112020-O.jpg",
                                                  price: 27900,
                                                  freeShipping: true,
                                                  itemCondition: "Usado",
                                                  imageRequestClosure: {_,_ in })
        self.sut.setUpComponentData(viewData: viewData)
    }
}

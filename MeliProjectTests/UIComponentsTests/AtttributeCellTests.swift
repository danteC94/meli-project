//
//  AtttributeCellTests.swift
//  MeliProjectTests
//
//  Created by dante on 05/01/2021.
//  Copyright © 2021 dante. All rights reserved.
//

import XCTest
@testable import class MeliProject.AtttributeCell
import struct MeliProject.Styles

class AtttributeCellTests: XCTestCase, TestBase {
    var sut: AtttributeCell!

    override func setUp() {
        super.setUp()
        sut = UINib.getNib(for: AtttributeCell.self) as? AtttributeCell
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testSetUpComponentStyles() {
        self.givenAnInitializedComponent()

        XCTAssertEqual(sut.mainContainer.layer.borderColor, UIColor.gray.cgColor)
        XCTAssertEqual(sut.mainContainer.layer.borderWidth, 2)
        XCTAssertEqual(sut.mainContainer.layer.cornerRadius, 10)
        XCTAssertEqual(sut.attributeName.textAlignment, .center)
        XCTAssertEqual(sut.attributeName.font , Styles.smallTitleFont)
        XCTAssertEqual(sut.attributeName.textColor, Styles.mainTitleColor)
        XCTAssertEqual(sut.attributeValue.textAlignment, .center)
        XCTAssertEqual(sut.attributeValue.font , Styles.descriptionFont)
        XCTAssertEqual(sut.attributeValue.textColor, Styles.descriptionColor)
    }

    func testSetUpComponentData() {
        self.givenAnInitializedComponentWithData()

        XCTAssertEqual(sut.attributeName.text, "Marca")
        XCTAssertEqual(sut.attributeValue.text, "Motorola")
    }

    // MARK: Given

    func givenAnInitializedComponent() {
        self.sut.setUpComponentStyles()
    }

    func givenAnInitializedComponentWithData() {
        let viewData = AtttributeCell.ViewData(attributeName: "Marca", attributeValue: "Motorola")
        self.sut.setUpComponentData(viewData: viewData)
    }
}

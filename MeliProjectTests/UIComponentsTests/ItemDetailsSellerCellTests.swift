//
//  ItemDetailsSellerCellTests.swift
//  MeliProjectTests
//
//  Created by dante on 05/01/2021.
//  Copyright © 2021 dante. All rights reserved.
//

import XCTest
@testable import class MeliProject.ItemDetailsSellerCell
import struct MeliProject.Styles

class ItemDetailsSellerCellTests: XCTestCase, TestBase {
    var sut: ItemDetailsSellerCell!

    override func setUp() {
        super.setUp()
        sut = UINib.getNib(for: ItemDetailsSellerCell.self) as? ItemDetailsSellerCell
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testSetUpComponentStyles() {
        self.givenAnInitializedComponent()

        XCTAssertEqual(sut.title.font, Styles.mainTitleFont)
        XCTAssertEqual(sut.title.textColor, Styles.mainTitleColor)
        XCTAssertEqual(sut.ratingsTitle.font, Styles.titleFont)
        XCTAssertEqual(sut.transactionsTitle.font, Styles.subtitleFont)
        XCTAssertEqual(sut.transactionsValue.font , Styles.descriptionFont)
        XCTAssertEqual(sut.transactionsValue.textColor, Styles.importantDescriptionColor)
        XCTAssertEqual(sut.transactionsCompletedTitle.font, Styles.subtitleFont)
        XCTAssertEqual(sut.transactionsCompletedValue.font , Styles.descriptionFont)
        XCTAssertEqual(sut.transactionsCompletedValue.textColor, Styles.importantDescriptionColor)
        XCTAssertEqual(sut.transactionsCanceledTitle.font, Styles.subtitleFont)
        XCTAssertEqual(sut.transactionsCanceledValue.font , Styles.descriptionFont)
        XCTAssertEqual(sut.transactionsCanceledValue.textColor, Styles.importantDescriptionColor)
    }

    func testSetUpComponentData() {
        self.givenAnInitializedComponentWithData()

        XCTAssertEqual(sut.title.text, "Datos del vendedor")
        XCTAssertEqual(sut.ratingsTitle.text, "Calificaciones")
        XCTAssertEqual(sut.transactionsTitle.text, "Cantidad de ventas")
        XCTAssertEqual(sut.transactionsValue.text, String(5))
        XCTAssertEqual(sut.transactionsCompletedTitle.text, "Cantidad de ventas exitosas")
        XCTAssertEqual(sut.transactionsCompletedValue.text, String(4))
        XCTAssertEqual(sut.transactionsCanceledTitle.text, "Cantidad de ventas canceladas")
        XCTAssertEqual(sut.transactionsCanceledValue.text, String(1))
        XCTAssertEqual(sut.firstStar.image, UIImage(systemName: "star.fill"))
        XCTAssertEqual(sut.secondStar.image, UIImage(systemName: "star.fill"))
        XCTAssertEqual(sut.thirdStar.image, UIImage(systemName: "star.fill"))
        XCTAssertEqual(sut.fourthStar.image, UIImage(systemName: "star.lefthalf.fill"))
        XCTAssertEqual(sut.fifthStar.image, UIImage(systemName: "star"))
    }

    func testSetRatingStarsWithTwoAndAHalfStars() {
        self.sut.setRatingStars(ratingValue: 0.52)

        XCTAssertEqual(sut.firstStar.image, UIImage(systemName: "star.fill"))
        XCTAssertEqual(sut.secondStar.image, UIImage(systemName: "star.fill"))
        XCTAssertEqual(sut.thirdStar.image, UIImage(systemName: "star.lefthalf.fill"))
        XCTAssertEqual(sut.fourthStar.image, UIImage(systemName: "star"))
        XCTAssertEqual(sut.fifthStar.image, UIImage(systemName: "star"))
    }

    // MARK: Given

    func givenAnInitializedComponent() {
        self.sut.setUpComponentStyles()
    }

    func givenAnInitializedComponentWithData() {
        let viewData = ItemDetailsSellerCell.ViewData(transactions: 5,
                                                      transactionsCompleted: 4,
                                                      transactionsCanceled: 1,
                                                      positiveRating: 0.76)
        self.sut.setUpComponentData(viewData: viewData)
    }
}

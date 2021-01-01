//
//  ItemImmutableModelTests.swift
//  MeliProjectTests
//
//  Created by dante on 31/12/2020.
//  Copyright © 2020 dante. All rights reserved.
//

import XCTest
@testable import struct MeliProject.ItemImmutableModel
@testable import class MeliProject.JsonDecoder

class ItemImmutableModelTest: XCTestCase, TestBase {
    var sut: ItemImmutableModel!

    func testDecodeItemImmutableModelModel() {
        sut = JsonDecoder(resource: "mock_item", resourceBundle: "com.dante.MeliProjectTests")
            .decodeModel(forType: ItemImmutableModel.self)

        XCTAssertEqual(sut.id, "MLA899102656")
        XCTAssertEqual(sut.siteId, "MLA")
        XCTAssertEqual(sut.title, "Celular Motorola G6 Play Dorado")
        XCTAssertEqual(sut.subtitle, nil)
        XCTAssertEqual(sut.sellerId, 155913199)
        XCTAssertEqual(sut.price, 27900)
        XCTAssertEqual(sut.basePrice, 27900)
        XCTAssertEqual(sut.currencyId, "ARS")
        XCTAssertEqual(sut.initialQuantity, 1)
        XCTAssertEqual(sut.availableQuantity, 1)
        XCTAssertEqual(sut.saleTerms!.first!.id, "WARRANTY_TYPE")
        XCTAssertEqual(sut.saleTerms!.first!.name, "Tipo de garantía")
        XCTAssertEqual(sut.saleTerms!.first!.valueName, "Sin garantía")
        XCTAssertEqual(sut.condition, "used")
        XCTAssertEqual(sut.secureThumbnail, "https://http2.mlstatic.com/D_965833-MLA44193184107_112020-I.jpg")
        XCTAssertEqual(sut.pictures!.count, 5)
        XCTAssertEqual(sut.pictures!.first?.id, "965833-MLA44193184107_112020")
        XCTAssertEqual(sut.pictures!.first?.secureUrl, "https://http2.mlstatic.com/D_965833-MLA44193184107_112020-O.jpg")
        XCTAssertEqual(sut.shipping!.mode, "me2")
        XCTAssertEqual(sut.shipping!.localPickUp, true)
        XCTAssertEqual(sut.shipping!.freeShipping, false)
        XCTAssertEqual(sut.shipping!.storePickUp, false)
        XCTAssertEqual(sut.sellerAddress!.city!.name, "Martinez")
        XCTAssertEqual(sut.sellerAddress!.state!.id, "AR-B")
        XCTAssertEqual(sut.sellerAddress!.state!.name, "Buenos Aires")
        XCTAssertEqual(sut.sellerAddress!.country!.id, "AR")
        XCTAssertEqual(sut.sellerAddress!.country!.name, "Argentina")
    }
}

//
//  ItemsImmutableModelTests.swift
//  MeliProjectTests
//
//  Created by dante on 02/01/2021.
//  Copyright © 2021 dante. All rights reserved.
//

import XCTest
@testable import struct MeliProject.ItemImmutableModel
@testable import struct MeliProject.ItemsImmutableModel
@testable import class MeliProject.JsonDecoder

class ItemsImmutableModelTest: XCTestCase, TestBase {
    var sut: ItemsImmutableModel!

    func testDecodeItemImmutableModelModel() {
        sut = JsonDecoder(resource: "mock_items", resourceBundle: "com.dante.MeliProjectTests")
            .decodeModel(forType: ItemsImmutableModel.self)

        XCTAssertEqual(sut.siteId, "MLA")
        XCTAssertEqual(sut.query, "Motorola G6")
        XCTAssertEqual(sut.paging.total, 588)
        XCTAssertEqual(sut.paging.primaryResults, 1000)
        XCTAssertEqual(sut.paging.offset, 50)
        XCTAssertEqual(sut.paging.limit, 2)
        XCTAssertEqual(sut.results.count, 2)
    }
}

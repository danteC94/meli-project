//
//  TestBase.swift
//  MeliProjectTests
//
//  Created by dante on 30/12/2020.
//  Copyright © 2020 dante. All rights reserved.
//

protocol TestBase {
    associatedtype SystemUnderTest
    /// The system under test(AKA: sut) represents
    /// the object intended to test.
    var sut: SystemUnderTest! { get set }
}

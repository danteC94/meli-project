//
//  Items.swift
//  MeliProject
//
//  Created by dante on 31/12/2020.
//  Copyright © 2020 dante. All rights reserved.
//

public struct ItemsImmutableModel: Decodable {
    let siteId: String
    let query: String?
    let paging: Paging
    let results: [ItemImmutableModel]

    enum CodingKeys: String, CodingKey {
        case siteId = "site_id"
        case query
        case paging
        case results
    }
}

public struct Paging: Decodable {
    let total: Int
    let primaryResults: Int?
    let offset: Int
    let limit: Int

    enum CodingKeys: String, CodingKey {
        case total
        case primaryResults = "primary_results"
        case offset
        case limit
    }
}

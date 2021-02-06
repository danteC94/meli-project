//
//  PaginatedOperation.swift
//  MeliProject
//
//  Created by dante on 01/01/2021.
//  Copyright © 2021 dante. All rights reserved.
//

struct PaginatedObject: Decodable {
    let paging: ObjectPaging

    enum CodingKeys: String, CodingKey {
        case paging
    }
}

struct ObjectPaging: Decodable {
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

//
//  NetworkManager+Search.swift
//  MeliProject
//
//  Created by dante on 01/01/2021.
//  Copyright © 2021 dante. All rights reserved.
//

import Foundation

extension NetworkManager {
    static func searchItems<T: Decodable>(decodableType: T.Type,
                                          pageSize: Int? = nil,
                                          paginated: Bool,
                                          query: String?,
                                          category: String?,
                                          success: @escaping SearchItemsOperation.searchItemsSuccess,
                                          failure: @escaping SearchItemsOperation.searchItemsFailure) {
        guard let location = Self.location, Self.session != nil else {
            assertionFailure("You need to set up the session before making http requests")
            return
        }

        var queryParams: [String: Any] = [:]

        if let query = query {
            queryParams["q"] = query
        }
        if let category = category {
            queryParams["category"] = category
        }

        queryParams["limit"] = pageSize ?? 20
        queryParams["offset"] = paginated ? (SearchItemsOperation.offset ?? 0) : 0

        guard let urlRequest = URLManager.setUpURL(for: .searchItems, location: location, queryParams: queryParams) else { return }

        SearchItemsOperation.searchItems(pageSize: pageSize ?? 20,
                                         paginated: paginated,
                                         urlRequest: urlRequest,
                                         decodableType: decodableType,
                                         success: success,
                                         failure: failure)

    }

    static func getItemDetails<T: Decodable>(decodableType: T.Type,
                                             itemId: String?,
                                             success: @escaping SearchItemsOperation.searchItemsSuccess,
                                             failure: @escaping SearchItemsOperation.searchItemsFailure) {
        guard let location = Self.location, Self.session != nil, let itemId = itemId else {
            assertionFailure("You need to set up the session before making http requests")
            return
        }
        guard let urlRequest = URLManager.setUpURL(for: .itemDetails(itemId: itemId), location: location, queryParams: nil) else { return }

        GetItemDetailsOperation.getItems(urlRequest: urlRequest,
                                         decodableType: decodableType,
                                         success: success,
                                         failure: failure)

    }
}

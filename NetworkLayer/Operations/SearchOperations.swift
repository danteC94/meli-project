//
//  SearchOperations.swift
//  MeliProject
//
//  Created by dante on 31/12/2020.
//  Copyright © 2020 dante. All rights reserved.
//

import Foundation

class SearchItemsOperation {
    typealias searchItemsSuccess = (Decodable) -> Void
    typealias searchItemsFailure = (Error?) -> Void

    static var offset: Int?

    static func searchItems<T: Decodable>(pageSize: Int,
                                          paginated: Bool,
                                          urlRequest: URLRequest,
                                          decodableType: T.Type,
                                          success: @escaping searchItemsSuccess,
                                          failure: @escaping searchItemsFailure) {

        TaskManager.makePaginatedHttpGetRequest(urlRequest: urlRequest, decodableType: decodableType, success: { decodableObject, pagination in
            if paginated {
                offset = pagination.paging.offset + pageSize
            }
            success(decodableObject)
        }, failure: { error in
            failure(error)
        })
    }
}

class GetItemDetailsOperation {
    typealias getItemDetailsSuccess = (Decodable) -> Void
    typealias getItemDetailsFailure = (Error?) -> Void

    static func getItems<T: Decodable>(urlRequest: URLRequest,
                                       decodableType: T.Type,
                                       success: @escaping getItemDetailsSuccess,
                                       failure: @escaping getItemDetailsFailure) {

        TaskManager.makeHttpGetRequest(urlRequest: urlRequest, decodableType: decodableType, success: { decodableObject in
            success(decodableObject)
        }, failure: { error in
            failure(error)
        })
    }
}

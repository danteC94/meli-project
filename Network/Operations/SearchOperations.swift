//
//  SearchOperations.swift
//  MeliProject
//
//  Created by dante on 31/12/2020.
//  Copyright © 2020 dante. All rights reserved.
//

import Foundation

internal class SearchItemsOperation {
    public typealias searchItemsSuccess = (Decodable) -> Void
    public typealias searchItemsFailure = (Error?) -> Void

    static var offset: Int?

    public static func searchItems<T: Decodable>(pageSize: Int,
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

internal class GetItemDetailsOperation {
    public typealias getItemDetailsSuccess = (Decodable) -> Void
    public typealias getItemDetailsFailure = (Error?) -> Void

    public static func getItems<T: Decodable>(urlRequest: URLRequest,
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

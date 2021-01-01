//
//  TaskManager.swift
//  MeliProject
//
//  Created by dante on 31/12/2020.
//  Copyright © 2020 dante. All rights reserved.
//

import Foundation

class TaskManager {
    public typealias HttpRequestSuccess = (Decodable) -> Void
    public typealias HttpRequestFailure = (Error?) -> Void

    public typealias PaginatedHttpRequestSuccess = (Decodable, PaginatedObject) -> Void
    public typealias PaginatedHttpRequestFailure = (Error?) -> Void

    static func makeHttpGetRequest<T: Decodable>(urlRequest: URLRequest,
                                                 decodableType: T.Type,
                                                 success: @escaping HttpRequestSuccess,
                                                 failure: @escaping HttpRequestFailure) {

        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest, completionHandler: { data, response, error -> Void in
            do {
                guard let data = data else { return }
                let model = try JSONDecoder().decode(decodableType, from: data)
                success(model)
            } catch let error {
                failure(error)
            }
        })
        task.resume()
    }

    static func makePaginatedHttpGetRequest<T: Decodable>(urlRequest: URLRequest,
                                                 decodableType: T.Type,
                                                 success: @escaping PaginatedHttpRequestSuccess,
                                                 failure: @escaping PaginatedHttpRequestFailure) {

        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest, completionHandler: { data, response, error -> Void in
            do {
                guard let data = data else { return }
                let model = try JSONDecoder().decode(decodableType, from: data)
                let pagination = try JSONDecoder().decode(PaginatedObject.self, from: data)
                success(model, pagination)
            } catch let error {
                failure(error)
            }
        })
        task.resume()
    }
}

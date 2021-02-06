//
//  TaskManager.swift
//  MeliProject
//
//  Created by dante on 31/12/2020.
//  Copyright © 2020 dante. All rights reserved.
//

import Foundation
import UIKit

/**
 This manager is in charge of making request to the network and
 decoding de data retrieved.
*/
class TaskManager {
    typealias HttpRequestSuccess = (Decodable) -> Void
    typealias HttpRequestFailure = (Error?) -> Void

    typealias PaginatedHttpRequestSuccess = (Decodable, PaginatedObject) -> Void
    typealias PaginatedHttpRequestFailure = (Error?) -> Void

    /// Makes an http get request for a decodable object.
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

    /// Makes a paginated http get request for a decodable object.
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

extension TaskManager {
    typealias HttpImageRequestSuccess = (UIImage) -> Void
    typealias HttpImageRequestFailure = (Error?) -> Void

    // This specific for images which are not decodable objects.
    /// Makes an http get request for an image.
    static func makeHttpGetRequestForImage(urlRequest: URLRequest,
                                           success: @escaping HttpImageRequestSuccess,
                                           failure: @escaping HttpImageRequestFailure) {

        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest, completionHandler: { data, response, error -> Void in
            guard let data = data, let image = UIImage(data: data) else {
                failure(nil)
                return
            }
            success(image)
        })
        task.resume()
    }
}

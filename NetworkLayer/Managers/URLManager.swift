//
//  URLManager.swift
//  MeliProject
//
//  Created by dante on 30/12/2020.
//  Copyright © 2020 dante. All rights reserved.
//

import Foundation

/**
 This manager is in charge of setting up the URL request for the
 the different endpoints supported.
*/
class URLManager {
    static func setUpURL(for endPoint: EndPoint,
                         location: Location,
                         queryParams: [String: Any]?) -> URLRequest? {
        let baseURL = Self.getBaseUrlString(for: endPoint, location: location)
        guard var urlRequest = Self.setUpURLRequest(with: baseURL, from: endPoint) else { return nil }
        guard let queryParams = queryParams else { return urlRequest }
        Self.setQueryParams(urlRequest: &urlRequest, queryParams: queryParams)
        return urlRequest
    }

    static func getBaseUrlString(for endPoint: EndPoint, location: Location) -> String {
        switch endPoint {
        case .searchItems:
            return "https://api.mercadolibre.com/sites/\(location.listingType.rawValue)/search"
        case .itemDetails(let productId):
            return "https://api.mercadolibre.com/items/\(productId)"
        case .image(imageURL: let imageURL):
            return imageURL
        }
    }

    static func setUpURLRequest(with baseURL: String, from endPoint: EndPoint) -> URLRequest? {
        let httpMethod = endPoint.allowedHTTPMethod.rawValue
        guard let url = URL(string: baseURL) else {
            assertionFailure("Could not load URL from httpRequest: \(baseURL)")
            return nil
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod

        return urlRequest
    }

    static func setQueryParams(urlRequest: inout URLRequest, queryParams: [String: Any]) {
        guard let url = urlRequest.url else { return }
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
        let queryItems = queryParams.map { key, value in
            URLQueryItem(name: key, value: "\(value)")
        }

        urlComponents?.queryItems = queryItems
        urlRequest.url = urlComponents?.url
    }
}

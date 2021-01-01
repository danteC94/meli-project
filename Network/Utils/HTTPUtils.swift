//
//  HTTPUtils.swift
//  MeliProject
//
//  Created by dante on 31/12/2020.
//  Copyright © 2020 dante. All rights reserved.
//

public enum SessionType {
    case network
    case localEnvironment
}

enum HttpMethodType: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case delete = "DELETE"
}

enum EndPoint {
    case searchProducts
    case productDetails(productId: String)

    var allowedHTTPMethod: HttpMethodType {
        switch self {
        case .searchProducts:
            return .get
        case .productDetails:
            return .get
        }
    }
}

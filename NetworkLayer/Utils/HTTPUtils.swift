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
    case searchItems
    case itemDetails(itemId: String)
    case image(imageURL: String)

    var allowedHTTPMethod: HttpMethodType {
        switch self {
        case .searchItems:
            return .get
        case .itemDetails:
            return .get
        case .image:
            return .get
        }
    }
}

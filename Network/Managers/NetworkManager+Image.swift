//
//  NetworkManager+Image.swift
//  MeliProjectTests
//
//  Created by dante on 02/01/2021.
//  Copyright © 2021 dante. All rights reserved.
//

import Foundation

extension NetworkManager {
    static func requestImage(imageURL: String,
                         success: @escaping ImageOperation.requestImageSuccess,
                         failure: @escaping ImageOperation.requestImageFailure) {
        guard let location = Self.location, Self.session != nil else {
            assertionFailure("You need to set up the session before making http requests")
            return
        }

        guard let urlRequest = URLManager.setUpURL(for: .image(imageURL: imageURL), location: location, queryParams: nil) else { return }

        ImageOperation.requestImage(urlRequest: urlRequest,
                                    success: success,
                                    failure: failure)
    }
}

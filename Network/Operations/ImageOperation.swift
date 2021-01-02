//
//  ImageOperation.swift
//  MeliProjectTests
//
//  Created by dante on 02/01/2021.
//  Copyright © 2021 dante. All rights reserved.
//

import Foundation
import UIKit

public class ImageOperation {
    public typealias requestImageSuccess = (UIImage) -> Void
    public typealias requestImageFailure = (Error?) -> Void

    public static func requestImage(urlRequest: URLRequest,
                                    success: @escaping requestImageSuccess,
                                    failure: @escaping requestImageFailure) {
        TaskManager.makeHttpGetRequestForImage(urlRequest: urlRequest, success: { image in
            success(image)
        }, failure: { error in
            failure(error)
        })
    }
}

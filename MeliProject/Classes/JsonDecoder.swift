//
//  JsonDecoder.swift
//  MeliProject
//
//  Created by dante on 31/12/2020.
//  Copyright © 2020 dante. All rights reserved.
//

import Foundation

public class JsonDecoder {
    let resource: String
    let resourceBundle: String

    public init(resource: String, resourceBundle: String) {
        self.resource = resource
        self.resourceBundle = resourceBundle
    }

    public func decodeModel<T: Decodable>(forType type: T.Type) -> T? {
        do {
            guard let jsonData = try self.getMockedJsonString(resourceBundle: self.resourceBundle) else { return nil }
            return try JSONDecoder().decode(T.self, from: jsonData)
        } catch {
            assertionFailure("Could not decode json for \(resource). \(error.localizedDescription)")
            return nil
        }
    }

    private func getMockedJsonString(resourceBundle: String) throws -> Data? {
        let bundle = Bundle(identifier: resourceBundle)
        guard let path: String = bundle?.path(forResource: resource, ofType: "json") else { throw NSError() }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
            if let string = String(data: data, encoding: String.Encoding.utf8), let jsonData = string.data(using: .utf8) {
                return jsonData
            }
        } catch let error {
            assertionFailure("Could not retrieve json data from \(resource). \(error.localizedDescription)")
        }
        return nil
    }
}

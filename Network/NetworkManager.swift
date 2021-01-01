//
//  NetworkManager.swift
//  MeliProject
//
//  Created by dante on 30/12/2020.
//  Copyright © 2020 dante. All rights reserved.
//

import Foundation

// Network should be moved to an independent module.
public class NetworkManager {
    static var session: SessionType?
    static var location: Location?

    public static func setUpSession(session: SessionType, location: Location) {
        self.session = session
        self.location = location
    }
}

//
//  NetworkManager.swift
//  MeliProject
//
//  Created by dante on 30/12/2020.
//  Copyright © 2020 dante. All rights reserved.
//

import Foundation

// Network should be moved to an independent module.
// NetworkManager should be the only interfaz visible for your app.
/**
 This is the main manager with which your app should communicate.
 This manager is in charge of receiving a request from an app, handling it and execute the completion block with the decoded data.
 It provides the interfaz to allow your app to make network requests.
*/
public class NetworkManager {
    static var session: SessionType?
    static var location: Location?

    public static func setUpSession(session: SessionType, location: Location) {
        self.session = session
        self.location = location
    }
}

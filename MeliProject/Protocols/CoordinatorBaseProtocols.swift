//
//  CoordinatorBaseProtocols.swift
//  MeliProject
//
//  Created by dante on 30/12/2020.
//  Copyright © 2020 dante. All rights reserved.
//

protocol Coordinator {
    func start()
}

protocol GenericCoordinator: Coordinator, GenericCoordinatorBase {
    func finish()
}

protocol MainCoordinator: Coordinator, MainCoordinatorBase {}

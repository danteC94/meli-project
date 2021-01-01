//
//  Listings.swift
//  MeliProject
//
//  Created by dante on 31/12/2020.
//  Copyright © 2020 dante. All rights reserved.
//

enum ListingType: String {
    case MLA
    case MLB
    case MLC
    case MLM
    case MCO
}

public enum Location {
    case Argentina
    case Brasil
    case Chile
    case Mexico
    case Colombia

    var listingType: ListingType {
        switch self {
        case .Argentina:
            return .MLA
        case .Brasil:
            return .MLB
        case .Chile:
            return .MLC
        case .Mexico:
            return .MLM
        case .Colombia:
            return .MCO
        }
    }
}

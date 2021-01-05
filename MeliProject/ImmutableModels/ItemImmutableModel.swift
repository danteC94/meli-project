//
//  Item.swift
//  MeliProject
//
//  Created by dante on 31/12/2020.
//  Copyright © 2020 dante. All rights reserved.
//

import Foundation

public struct ItemImmutableModel: Decodable {
    let id: String?
    let siteId: String
    let title: String
    let subtitle: String?
    let sellerId: Int?
    let seller: Seller?
    let price: Double
    let basePrice: Double?
    let currencyId: String
    let initialQuantity: Int?
    let availableQuantity: Int?
    let saleTerms: [SaleTerms]?
    let condition: String?
    let thumbnail: String?
    let secureThumbnail: String?
    let pictures: [Picture]?
    let acceptsMercadopago: Bool?
    let installments: Installments?
    let shipping: Shipping?
    let sellerAddress: SellerAddress?
    let attributes: [Attribute]?

    enum CodingKeys: String, CodingKey {
        case id
        case siteId = "site_id"
        case title
        case subtitle
        case sellerId = "seller_id"
        case seller
        case price
        case basePrice = "base_price"
        case currencyId = "currency_id"
        case initialQuantity = "initial_quantity"
        case availableQuantity = "available_quantity"
        case saleTerms = "sale_terms"
        case condition
        case thumbnail
        case secureThumbnail = "secure_thumbnail"
        case pictures
        case acceptsMercadopago = "accepts_mercadopago"
        case installments
        case shipping
        case sellerAddress = "seller_address"
        case attributes
    }
}

public struct SaleTerms: Decodable {
    let id: String
    let name: String
    let valueName: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case valueName = "value_name"
    }
}

public struct Picture: Decodable {
    let id: String
    let secureUrl: String?

    enum CodingKeys: String, CodingKey {
        case id
        case secureUrl = "secure_url"
    }
}

public struct Installments: Decodable {
    let quantity: Int?
    let amount: Double?
}

public struct Shipping: Decodable {
    let mode: String?
    let localPickUp: Bool?
    let freeShipping: Bool?
    let storePickUp: Bool?

    enum CodingKeys: String, CodingKey {
        case mode
        case localPickUp = "local_pick_up"
        case freeShipping = "free_shipping"
        case storePickUp = "store_pick_up"
    }
}

public struct SellerAddress: Decodable {
    let city: City?
    let state: State?
    let country: Country?
}


public struct City: Decodable {
    let name: String?
}

public struct State: Decodable {
    let id: String
    let name: String?
}

public struct Country: Decodable {
    let id: String
    let name: String?
}

public struct Attribute: Decodable {
    let id: String?
    let name: String?
    let valueName: String?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case valueName = "value_name"
    }
}

public struct Seller: Decodable {
    let id: Int
    let sellerReputation: SellerReputation?

    enum CodingKeys: String, CodingKey {
        case id
        case sellerReputation = "seller_reputation"
    }
}

public struct SellerReputation: Decodable {
    let transactions: Transactions?
}

public struct Transactions: Decodable {
    let total: Int?
    let canceled: Int?
    let ratings: Ratings?
    let completed: Int?
}

public struct Ratings: Decodable {
    let negative: Float?
    let positive: Float?
    let neutral: Float?
}

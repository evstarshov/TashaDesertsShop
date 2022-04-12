//
//  CartResponse.swift
//  TashaDesertsShop
//
//  Created by Евгений Старшов on 07.04.2022.
//

import Foundation

struct CartResponse: Codable {
    var amount: Int?
    var count: Int?
    var contents: [CartContents]
}

struct CartContents: Codable {
    var productId: Int?
    var productName: String?
    var productPrice: Int?
    var quantity: Int?
}

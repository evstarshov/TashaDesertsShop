//
//  ProductResponse.swift
//  TashaDesertsShop
//
//  Created by Евгений Старшов on 02.05.2022.
//

import Foundation

struct ProductResponse: Codable {
    let result: Int?
    let productId: Int?
    let productName: String?
    let price: Int?
    let description: String?
    let picUrl: String?
}

//
//  Product.swift
//  TashaDesertsShop
//
//  Created by Евгений Старшов on 31.03.2022.
//

import Foundation

struct Product: Codable {
    let result: Int?
    let price: Int?
    let description: String?
    
    enum CodingKeys: String, CodingKey {
        case price = "product_price"
        case description = "product_description"
        case result
    }
}

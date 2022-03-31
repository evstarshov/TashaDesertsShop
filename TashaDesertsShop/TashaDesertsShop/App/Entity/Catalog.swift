//
//  Catalog.swift
//  TashaDesertsShop
//
//  Created by Евгений Старшов on 31.03.2022.
//

import Foundation

struct Catalog: Codable {
    let id: Int
    let productName: String
    let productDescription: String?
    let price: Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "id_product"
        case productName = "product_name"
        case price
        case productDescription
    }
}

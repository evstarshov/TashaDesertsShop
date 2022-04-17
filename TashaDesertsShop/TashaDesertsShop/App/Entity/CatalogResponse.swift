//
//  CatalogResponse.swift
//  TashaDesertsShop
//
//  Created by Евгений Старшов on 17.04.2022.
//

import Foundation

struct CatalogResponse: Codable {
    let productId: Int?
    let productName: String?
    let price: Int?
    let shortDescription: String?
    let picUrl: String?
}

//
//  CakeCellFactory.swift
//  TashaDesertsShop
//
//  Created by Евгений Старшов on 17.04.2022.
//

import Foundation

struct CatalogResponseModel: Codable {
    let productId: Int?
    let productName: String?
    let price: Int?
    let shortDescription: String?
    let picUrl: String?
}

final class CakesCellFactory {
    static func cakeCellFactory(from model: CatalogResponse) -> CatalogResponseModel {
        return CatalogResponseModel(productId: model.productId, productName: model.productName, price: model.price, shortDescription: model.shortDescription, picUrl: model.picUrl)
    }
}

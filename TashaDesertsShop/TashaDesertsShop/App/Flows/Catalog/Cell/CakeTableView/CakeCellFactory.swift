//
//  CakeCellFactory.swift
//  TashaDesertsShop
//
//  Created by Евгений Старшов on 17.04.2022.
//

import Foundation

protocol CatalogResponseModel: Codable {
    var productId: Int? { get }
    var productName: String? { get }
    var price: Int? { get }
    var shortDescription: String? { get }
    var picUrl: String? { get }
}

struct CatalagogResponseModelImpl: CatalogResponseModel {
    var productId: Int?
    var productName: String?
    var price: Int?
    var shortDescription: String?
    var picUrl: String?
}

final class CakesCellFactory {
    static func cellModel(from model: CatalogResponse) -> CatalagogResponseModelImpl {
        return CatalagogResponseModelImpl(productId: model.productId, productName: model.productName, price: model.price, shortDescription: model.shortDescription, picUrl: model.picUrl)
    }
}

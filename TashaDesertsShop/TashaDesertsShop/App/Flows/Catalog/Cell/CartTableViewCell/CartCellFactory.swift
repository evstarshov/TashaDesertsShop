//
//  CartCellFactory.swift
//  TashaDesertsShop
//
//  Created by Евгений Старшов on 05.05.2022.
//

import Foundation

protocol CartCellModel: Codable {
    var productId: Int? { get }
    var productName: String? { get }
    var price: Int? { get }
    var picUrl: String? { get }
}

struct CartCellModelImpl: CartCellModel {
    var productId: Int?
    var productName: String?
    var price: Int?
    var picUrl: String?
}

final class CartCellModelFactory {
    static func cartCellModel(from model: CartItems) -> CartCellModelImpl {
        return CartCellModelImpl(productId: model.productId, productName: model.productName, price: model.price, picUrl: model.picUrl)
    }
}

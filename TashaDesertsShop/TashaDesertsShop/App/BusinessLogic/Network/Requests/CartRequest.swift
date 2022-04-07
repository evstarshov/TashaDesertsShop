//
//  CartRequest.swift
//  TashaDesertsShop
//
//  Created by Евгений Старшов on 07.04.2022.
//

import Foundation

struct CartRequest: Codable {
    var productId: Int?
    var quantity: Int?
}

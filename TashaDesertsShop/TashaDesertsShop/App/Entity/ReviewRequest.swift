//
//  Review.swift
//  TashaDesertsShop
//
//  Created by Евгений Старшов on 07.04.2022.
//

import Foundation

struct ReviewRequest: Codable {
    let reviewText: String?
    let userId: Int?
    let productId: Int?
}

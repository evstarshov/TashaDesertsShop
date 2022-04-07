//
//  Review.swift
//  TashaDesertsShop
//
//  Created by Евгений Старшов on 07.04.2022.
//

import Foundation

struct Review: Codable {
    let id: Int
    let productId: Int
    let userId: Int
    let text: String
    let rating: Int
    let likes: Int
}

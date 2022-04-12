//
//  ReviewResult.swift
//  TashaDesertsShop
//
//  Created by Евгений Старшов on 07.04.2022.
//

import Foundation

struct ReviewResponse: Codable {
    let userId: Int?
    let reviewText: String?
}

//
//  ReviewResult.swift
//  TashaDesertsShop
//
//  Created by Евгений Старшов on 07.04.2022.
//

import Foundation

struct ReviewResult: Codable {
    let result: Int
    let reviews: [ReviewRequest]?
    let errorMessage: String?
}

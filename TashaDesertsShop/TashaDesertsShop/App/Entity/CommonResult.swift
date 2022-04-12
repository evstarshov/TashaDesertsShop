//
//  CommonResult.swift
//  TashaDesertsShop
//
//  Created by Евгений Старшов on 07.04.2022.
//

import Foundation

struct CommonResult: Codable {
    var result: Int
    var successMessage: String?
    var errorMessage: String?
}

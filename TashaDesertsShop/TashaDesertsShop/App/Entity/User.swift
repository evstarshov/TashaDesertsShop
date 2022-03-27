//
//  User.swift
//  TashaDesertsShop
//
//  Created by Евгений Старшов on 27.03.2022.
//

import Foundation


struct User: Codable {
    let id: Int
    let login: String
    let name: String
    let lastname: String
}

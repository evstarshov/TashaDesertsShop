//
//  User.swift
//  TashaDesertsShop
//
//  Created by Евгений Старшов on 27.03.2022.
//

import Foundation


struct User: Codable {
    let id: Int?
    let login: String?
    let name: String?
    let lastname: String?
    let password: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id_user"
        case login = "user_login"
        case name = "user_name"
        case lastname = "user_lastname"
        case password
        
    }
    
    init (id: Int? = nil, login: String? = nil, password: String? = nil, lastname: String? = nil, name: String? = nil) {
        self.id = id
        self.login = login
        self.password = password
        self.name = name
        self.lastname = lastname
    }
}

//
//  UserIDkeeper.swift
//  TashaDesertsShop
//
//  Created by Евгений Старшов on 09.05.2022.
//

import Foundation

final class UserKeeper {
    static let shared = UserKeeper()
    public var userLogin: User?
    private init(){}
}

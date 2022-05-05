//
//  CartKeeper.swift
//  TashaDesertsShop
//
//  Created by Евгений Старшов on 05.05.2022.
//

import Foundation

final class CartKeeper {
    static let shared = CartKeeper()
    private init(){}
    public var cartItems: [CartItems] = []
}


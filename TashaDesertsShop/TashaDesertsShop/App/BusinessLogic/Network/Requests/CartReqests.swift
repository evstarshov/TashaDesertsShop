//
//  CartReqests.swift
//  TashaDesertsShop
//
//  Created by Евгений Старшов on 07.04.2022.
//

import Foundation
import Alamofire

class Cart: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "https://vast-retreat-13451.herokuapp.com/")!
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
            self.errorParser = errorParser
            self.sessionManager = sessionManager
            self.queue = queue
        }
}

extension Cart: CartRequestFactory {
    func getCart(user: User, completionHandler: @escaping (AFDataResponse<CartResponse>) -> Void) {
        let requestModel = GetCart(baseUrl: baseUrl, user: user)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func payCart(user: User, completionHandler: @escaping (AFDataResponse<CommonResult>) -> Void) {
        let requestModel = PayCart(baseUrl: baseUrl, user: user)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func addToCart(cart: CartRequest, completionHandler: @escaping (AFDataResponse<CommonResult>) -> Void) {
        let requestModel = AddToCart(baseUrl: baseUrl, cart: cart)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func deleteFromCart(cart: CartRequest, completionHandler: @escaping (AFDataResponse<CommonResult>) -> Void) {
        let requestModel = DeleteFromCart(baseUrl: baseUrl, cart: cart)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Cart {
    struct GetCart: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "getcart"

        let user: User

        var parameters: Parameters? {
            return [
                "id": user.id ?? 0
            ]
        }
    }
    
    struct PayCart: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "paycart"

        let user: User

        var parameters: Parameters? {
            return [
                "id": user.id ?? 0
            ]
        }
    }
    
    struct AddToCart: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "addtocart"

        let cart: CartRequest

        var parameters: Parameters? {
            return [
                "productId": cart.productId ?? 0,
                "quantity": cart.quantity ?? 0
            ]
        }
    }
    
    struct DeleteFromCart: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "deletefromcart"

        let cart: CartRequest

        var parameters: Parameters? {
            return [
                "productId": cart.productId ?? 0
            ]
        }
    }
}

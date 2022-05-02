//
//  GetProduct.swift
//  TashaDesertsShop
//
//  Created by Евгений Старшов on 31.03.2022.
//

import Foundation
import Alamofire

class GetProduct: AbstractRequestFactory {
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

extension GetProduct: GetProductRequestFactory {
    func getProduct(productId: Int, completionHandler: @escaping (AFDataResponse<ProductResponse>) -> Void) {
        let requestModel = GetProduct(baseUrl: baseUrl, productId: productId)
        self.request(request: requestModel, completionHandler: completionHandler)
    } 
}

extension GetProduct {
    struct GetProduct: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "getproduct"
        let productId: Int
        var parameters: Parameters? {
            return [
                "productId": productId
            ]
        }
    }
}

//
//  GetProductRequestFactory.swift
//  TashaDesertsShop
//
//  Created by Евгений Старшов on 31.03.2022.
//

import Foundation
import Alamofire

protocol GetProductRequestFactory {
    func getProduct(productId: Int, completionHandler: @escaping (AFDataResponse<ProductResponse>) -> Void)
}

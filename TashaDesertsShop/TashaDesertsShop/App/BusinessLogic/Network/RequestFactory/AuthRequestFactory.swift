//
//  AuthRequestFactory.swift
//  TashaDesertsShop
//
//  Created by Евгений Старшов on 27.03.2022.
//

import Foundation
import Alamofire

protocol AuthRequestFactory {
    func login(user: User, completionHandler: @escaping (AFDataResponse<CommonResult>) -> Void)
    func logout(user: User, completionHandler: @escaping (AFDataResponse<CommonResult>) -> Void)
}

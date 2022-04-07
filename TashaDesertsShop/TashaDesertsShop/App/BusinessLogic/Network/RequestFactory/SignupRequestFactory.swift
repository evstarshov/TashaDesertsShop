//
//  SignupRequestFactory.swift
//  TashaDesertsShop
//
//  Created by Евгений Старшов on 27.03.2022.
//

import Foundation
import Alamofire

protocol SignupRequestFactory {
    func signup(user: User, completionHandler: @escaping (AFDataResponse<CommonResult>) -> Void)
}

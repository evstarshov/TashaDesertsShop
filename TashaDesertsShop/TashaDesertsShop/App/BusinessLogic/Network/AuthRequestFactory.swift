//
//  AuthRequestFactory.swift
//  TashaDesertsShop
//
//  Created by Евгений Старшов on 27.03.2022.
//

import Foundation
import Alamofire

protocol AuthRequestFactory {
    func login(userName: String, password: String, complitionHandler: @escaping(AFDataResponse<LoginResult>) -> Void)
}

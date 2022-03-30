//
//  AuthRequestFactory.swift
//  TashaDesertsShop
//
//  Created by Евгений Старшов on 27.03.2022.
//

import Foundation
import Alamofire

protocol AuthRequestFactory {
    func login(userName: String, password: String, completionHandler: @escaping(AFDataResponse<LoginResult>) -> Void)
    func logout(user: User, completionHandler: @escaping (AFDataResponse<LogoutResult>) -> Void)
}

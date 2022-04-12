//
//  ChangeUserDataRequestFactory.swift
//  TashaDesertsShop
//
//  Created by Евгений Старшов on 27.03.2022.
//

import Foundation
import Alamofire

protocol ChangeUserDataRequestFactory {
    func changeUserData(user: User, completionHandler: @escaping(AFDataResponse<CommonResult>) -> Void)
}

//
//  RequestRouter.swift
//  TashaDesertsShop
//
//  Created by Евгений Старшов on 27.03.2022.
//

import Foundation
import Alamofire

enum RequestRouterEncoding {
    case url, json
}


protocol RequestRouter: URLRequestConvertible {
    
    var baseUrl: URL { get }
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
    var fullUrl: URL { get }
    var encoding: RequestRouterEncoding { get }
    
}


extension RequestRouter {
    
    var fullUrl: URL {
        return baseUrl.appendingPathComponent(path)
    }
    
}

//
//  Auth.swift
//  TashaDesertsShop
//
//  Created by Евгений Старшов on 27.03.2022.
//

import Foundation
import Alamofire

class Auth: AbstractRequestFactory {
    
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    
    init(errorParser: AbstractErrorParser, sessionManager: Session, queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
    
}


extension Auth: AuthRequestFactory {
    
    func logout(user: User, completionHandler: @escaping (AFDataResponse<LogoutResult>) -> Void) {
        let requestModel = Login(baseUrl: baseUrl, login: user.login, password: user.password)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func login(userName: String, password: String, completionHandler: @escaping
               (AFDataResponse<LoginResult>) -> Void) {
        let requestModel = Login(baseUrl: baseUrl, login: userName, password:
                                    password)
        self.request(request: requestModel, completionHandler:
                        completionHandler) }
    
}

extension Auth {
    struct Login: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "login.json"
        let login: String
        let password: String
        var parameters: Parameters? {
            return [
                "username": login,
                "password": password
            ]
            
        }
    
    }
    
    struct Logout: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "logout.json"
        
        let user: User
        var parameters: Parameters? {
            return [
                "username": user.login,
            ]
            
        }
        
    }
    
}

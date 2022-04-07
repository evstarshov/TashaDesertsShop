//
//  Signup.swift
//  TashaDesertsShop
//
//  Created by Евгений Старшов on 27.03.2022.
//

import Foundation
import Alamofire

class Signup: AbstractRequestFactory {
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

extension Signup: SignupRequestFactory {
    func signup(user: User, completionHandler: @escaping (AFDataResponse<CommonResult>) -> Void) {
        let requestModel = Signup(baseUrl: baseUrl, user: user)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Signup {
    struct Signup: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "signup"
        
        let user: User
        var parameters: Parameters? {
            return [
                "id": user.id ?? 0,
                "login": user.login ?? "",
                "password": user.password ?? "",
                "email": user.email ?? "",
                "gender": user.gender ?? "",
                "creditCard": user.creditCard ?? "",
                "bio": user.bio ?? ""
            ]
        }
    }
}

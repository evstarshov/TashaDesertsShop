//
//  GetCatalog.swift
//  TashaDesertsShop
//
//  Created by Евгений Старшов on 31.03.2022.
//

import Foundation
import Alamofire

class GetCatalog: AbstractRequestFactory {
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

extension GetCatalog: GetCatalogRequestFactory {
    func getCatalog(pageNumber: Int, categoryId: Int, completionHandler: @escaping (AFDataResponse<[CatalogResponse]>) -> Void) {
        let requestModel = GetCatalog(baseUrl: baseUrl, pageNumber: pageNumber, categoryId: categoryId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension GetCatalog {
    struct GetCatalog: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "getcatalog"
        let pageNumber: Int
        let categoryId: Int
        var parameters: Parameters? {
            return [
                "page_number": pageNumber,
                "id_category": categoryId
            ]
        }
    }
}

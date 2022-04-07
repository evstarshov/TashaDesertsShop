//
//  Reviews.swift
//  TashaDesertsShop
//
//  Created by Евгений Старшов on 07.04.2022.
//

import Foundation
import Alamofire

class Reviews: AbstractRequestFactory {
    
    var errorParser: AbstractErrorParser
    var sessionManager: Session
    var queue: DispatchQueue
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

extension Reviews: ReviewsRequestFactory {
    func getReviews(productId: Int, completionHandler: @escaping (AFDataResponse<ReviewResult>) -> Void) {
        let requestModel = ReviewData(baseUrl: baseUrl, path: "getreviews", productId: productId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func addReview(productId: Int, userId: Int, text: String, rating: Int, completionHandler: @escaping (AFDataResponse<CommonResult>) -> Void) {
        let requestModel = ReviewData(baseUrl: baseUrl, path: "addReview", productId: productId, userId: userId, text: text, rating: rating)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func removeReview(reviewId: Int, completionHandler: @escaping (AFDataResponse<CommonResult>) -> Void) {
        let requestModel = ReviewData(baseUrl: baseUrl, path: "removeReview", reviewId: reviewId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Reviews {
    struct GetReviewsData: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        var path: String
        
        let productId: Int
        var parameters: Parameters? {
            return [
                "productId": productId
            ]
        }
    }
    
    struct ReviewData: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        var path: String
        
        var productId: Int? = nil
        var userId: Int? = nil
        var text: String? = nil
        var rating: Int? = nil
        var reviewId: Int? = nil
        var parameters: Parameters? {
            return [
                "productId": productId as Any,
                "userId": userId as Any,
                "text": text as Any,
                "rating": rating as Any,
                "reviewId": reviewId as Any
            ]
        }
        
        init(baseUrl: URL, path: String, productId: Int) {
            self.baseUrl = baseUrl
            self.path = path
            self.productId = productId
        }
        
        init(baseUrl: URL, path: String, reviewId: Int) {
            self.baseUrl = baseUrl
            self.path = path
            self.reviewId = reviewId
        }
        
        init(baseUrl: URL, path: String, productId: Int, userId: Int, text: String, rating: Int) {
            self.baseUrl = baseUrl
            self.path = path
            self.productId = productId
            self.userId = userId
            self.text = text
            self.rating = rating
        }
    }
}

//
//  Reviews.swift
//  TashaDesertsShop
//
//  Created by Евгений Старшов on 07.04.2022.
//

import Foundation
import Alamofire

class Reviews: AbstractRequestFactory {
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

extension Reviews: ReviewRequestFactory {
    func removeReview(reviewId: Int, completionHandler: @escaping (AFDataResponse<CommonResult>) -> Void) {
        let requestModel = RemoveReview(baseUrl: baseUrl, reviewId: reviewId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func addReview(review: ReviewRequest, completionHandler: @escaping (AFDataResponse<CommonResult>) -> Void) {
        let requestModel = AddReview(baseUrl: baseUrl, review: review)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func getReviews(productId: Int, completionHandler: @escaping (AFDataResponse<[ReviewResult]>) -> Void) {
        let requestModel = GetReviews(baseUrl: baseUrl, productId: productId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Reviews {
    struct RemoveReview: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "removereview"

        let reviewId: Int

        var parameters: Parameters? {
            return [
                "reviewId": reviewId
            ]
        }
    }
    
    struct AddReview: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "addreview"

        let review: ReviewRequest

        var parameters: Parameters? {
            return [
                "productId": review.productId ?? 0,
                "userId": review.userId ?? 0,
                "reviewText": review.reviewText ?? ""
            ]
        }
    }
    struct GetReviews: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "getreviews"

        let productId: Int

        var parameters: Parameters? {
            return [
                "productId": productId
            ]
        }
    }
}

//
//  ReviewRequestFactory.swift
//  TashaDesertsShop
//
//  Created by Евгений Старшов on 07.04.2022.
//

import Foundation
import Alamofire

protocol ReviewsRequestFactory {
    func getReviews(productId: Int,
                  completionHandler: @escaping (AFDataResponse<ReviewResult>) -> Void)
    
    func addReview(productId: Int, userId: Int, text: String, rating: Int,
                  completionHandler: @escaping (AFDataResponse<CommonResult>) -> Void)
    
    func removeReview(reviewId: Int, completionHandler: @escaping (AFDataResponse<CommonResult>) -> Void)
}

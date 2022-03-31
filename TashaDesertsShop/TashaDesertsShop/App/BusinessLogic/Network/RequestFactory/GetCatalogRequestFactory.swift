//
//  GetCatalogRequestFactory.swift
//  TashaDesertsShop
//
//  Created by Евгений Старшов on 31.03.2022.
//

import Foundation
import Alamofire

protocol GetCatalogRequestFactory {
    func getCatalog(pageNumber: Int, categoryId: Int, completionHandler: @escaping (AFDataResponse<[Catalog]>) -> Void)
}

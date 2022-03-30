//
//  ErrorParser.swift
//  TashaDesertsShop
//
//  Created by Евгений Старшов on 27.03.2022.
//

import Foundation

class ErrorParser: AbstractErrorParser { func parse(_ result: Error) -> Error {
    
return result
    
}
    
func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? {
    
return error
    
    }
}

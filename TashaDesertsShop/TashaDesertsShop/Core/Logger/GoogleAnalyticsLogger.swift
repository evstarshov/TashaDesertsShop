//
//  GoogleAnalyticsLogger.swift
//  TashaDesertsShop
//
//  Created by Евгений Старшов on 09.05.2022.
//

import Foundation
import Firebase

class GoogleAnalyticsLogger {
    class func logEvent(name: String, key: String, value: String) {
        Analytics.logEvent(name, parameters: [key: value])
    }
}

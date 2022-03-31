//
//  RequestsTest.swift
//  TashaDesertsShopTests
//
//  Created by Евгений Старшов on 31.03.2022.
//

import XCTest
@testable import TashaDesertsShop

class  RequestsTests: XCTestCase {
    let timeoutValue = 10.0
    let expectation = XCTestExpectation(description: "Perform request.")
    var requestFactory: RequestFactory!
    var user: User!
    
    

    override func setUpWithError() throws {
        try? super.setUpWithError()
        requestFactory = RequestFactory()
        user = User(id: 123, login: "pinkiepie", password: "mypassword", lastname: "Zaycev", name: "Slava")
    }

    override func tearDownWithError() throws {
        try? super.tearDownWithError()
        requestFactory = nil
        user = nil
    }
    
    func testShouldPerformAuthRequest() {
        let factory = requestFactory.makeAuthRequestFactory()
        
        factory.login(userName: user.login ?? "", password: user.password ?? "") { response in
            switch response.result {
            case .success(let result): XCTAssertEqual(result.result, 1)
            case .failure: XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeoutValue)
    }
}

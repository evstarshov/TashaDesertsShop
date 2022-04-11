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
        user = User(login: "rakodill",
                    password: "mypass",
                    email: "rakodill@gmail.com",
                    gender: "f",
                    creditCard: "2352-8677-1210-6546",
                    bio: "Some bio text",
                    name: "Vadim",
                    lastname: "Kichuk")
    }

    override func tearDownWithError() throws {
        try? super.tearDownWithError()
        requestFactory = nil
        user = nil
    }
    
    func testShouldPerformAuthRequest() {
        let factory = requestFactory.makeAuthRequestFactory()
        
        factory.login(user: user) { response in
            switch response.result {
            case .success(let result): XCTAssertEqual(result.result, 1)
            case .failure: XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeoutValue)
    }
    
    func testShouldPerformSignupRequest() {
        let factory = requestFactory.makeSignupRequestFactory()
        
        factory.signup(user: user) { response in
            switch response.result {
            case .success(let result): XCTAssertEqual(result.result, 1)
            case .failure: XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeoutValue)
    }
    
    func testShouldPerformChangeUserDataRequest() {
        let factory = requestFactory.makeChangeUserDataRequestFactory()
        
        factory.changeUserData(user: user) { response in
            switch response.result {
            case .success(let result): XCTAssertEqual(result.result, 1)
            case .failure: XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeoutValue)
    }
    
    func testShouldPerformLogoutRequest() {
        let factory = requestFactory.makeAuthRequestFactory()
        
        factory.logout(user: user) { response in
            switch response.result {
            case .success(let result): XCTAssertEqual(result.result, 1)
            case .failure: XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeoutValue)
    }
    
    //MARK: Catalog request
    
    func testShouldPerformGetCatalogRequest() {
        let factory = requestFactory.makeGetCatalogRequestFactory()
        
        factory.getCatalog(pageNumber: 1, categoryId: 1) { response in
            switch response.result {
            case .success: break
            case .failure: XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeoutValue)
    }
    
    // MARK: Product test
    
    func testShouldPerformGetProductRequest() {
        let factory = requestFactory.makeGetProductRequestFactory()
        
        factory.getProduct(productId: 123) { response in
            switch response.result {
            case .success(let result): XCTAssertEqual(result.result, 1)
            case .failure: XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeoutValue)
    }
    
    //MARK: Review tests
    
    func testShouldPerformGetReviewsRequest() {
        let factory = requestFactory.makeReviewRequestFactory()
        
        factory.getReviews(productId: 123) { response in
            switch response.result {
            case .success(let result): XCTAssertGreaterThan(result.count, 0)
            case .failure: XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeoutValue)
    }
    
    func testShouldPerformAddReviewsRequest() {
        let factory = requestFactory.makeReviewRequestFactory()
        
        factory.addReview(review: ReviewRequest(reviewText: "Плохой товар", userId: 123, productId: 666)) { response in
            switch response.result {
            case .success(let result): XCTAssertEqual(result.result, 1)
            case .failure: XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeoutValue)
    }
    
    func testShouldPerformRemoveReviewsRequest() {
        let factory = requestFactory.makeReviewRequestFactory()
        
        factory.removeReview(reviewId: 123) { response in
            switch response.result {
            case .success(let result): XCTAssertEqual(result.result, 1)
            case .failure: XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeoutValue)
    }
    
    //MARK: Cart tests:
    
    func testShouldPerformGetCartRequest() {
        let factory = requestFactory.makeCartRequestFactory()
        
        factory.getCart(user: User(id: 123)){ response in
            switch response.result {
            case .success(let result): XCTAssertNotNil(result.count)
            case .failure: XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeoutValue)
    }
    
    func testShouldPerformPayCartRequest() {
        let factory = requestFactory.makeCartRequestFactory()
        
        factory.payCart(user: User(id: 123)){ response in
            switch response.result {
            case .success(let result): XCTAssertEqual(result.result, 1)
            case .failure: XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeoutValue)
    }
    
    func testShouldPerformAddToCartRequest() {
        let factory = requestFactory.makeCartRequestFactory()
        
        factory.addToCart(cart: CartRequest(productId: 666, quantity: 1)){ response in
            switch response.result {
            case .success(let result): XCTAssertEqual(result.result, 1)
            case .failure: XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeoutValue)
    }
    
    func testShouldPerformDeleteFromCartRequest() {
        let factory = requestFactory.makeCartRequestFactory()
        
        factory.deleteFromCart(cart: CartRequest(productId: 666)){ response in
            switch response.result {
            case .success(let result): XCTAssertEqual(result.result, 1)
            case .failure: XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeoutValue)
    }
}

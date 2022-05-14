//
//  TashaDesertsShopUITests.swift
//  TashaDesertsShopUITests
//
//  Created by Евгений Старшов on 22.03.2022.
//

import XCTest

class TashaDesertsShopUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        setupSnapshot(app)
        app.launch()
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
    func testSuccessfulLogin() throws {
        snapshot("LoginScreen")
        let app = XCUIApplication()
        app.launch()
        app.otherElements.buttons["Войти"].tap()
    }
    
    func testFailedLogin() throws {
        let app = XCUIApplication()
        app.launch()
        let element = app.otherElements
        element.textFields["Введите пароль"].clearAndEnterText(text: "неправильный пароль")
        app.otherElements.buttons["Войти"].tap()
        XCTAssert(app.alerts.firstMatch.waitForExistence(timeout: 2.0))
        app.alerts["Ошибка авторизации"].otherElements.buttons["Ок("].tap()
    }
    
    
}


extension XCUIElement {
    func clearAndEnterText(text: String) {
        guard let stringValue = self.value as? String else {
            XCTFail("Tried to clear and enter text into a non string value")
            return
        }
        
        self.tap()
        let deleteString = String(repeating: XCUIKeyboardKey.delete.rawValue, count: stringValue.count)
        self.typeText(deleteString)
        self.typeText(text)
    }
}

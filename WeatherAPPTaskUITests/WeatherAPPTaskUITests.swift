//
//  WeatherAPPTaskUITests.swift
//  WeatherAPPTaskUITests
//
//  Created by Mahmoud Abdul-Wahab on 03/08/2021.
//

import XCTest

class WeatherAPPTaskUITests: XCTestCase {
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    override func tearDownWithError() throws {
        
    }
    
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        //app.launch()
        app.searchFields("")

    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}

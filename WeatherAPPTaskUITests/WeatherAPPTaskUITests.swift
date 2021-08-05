//
//  WeatherAPPTaskUITests.swift
//  WeatherAPPTaskUITests
//
//  Created by Mahmoud Abdul-Wahab on 03/08/2021.
//

import XCTest

class WeatherAPPTaskUITests: XCTestCase {
    
    func test_Search_Flow_Example() throws {
        
        let app = XCUIApplication()
        app.launch()
        let searchByCityNameTextField = app.textFields["Search By City Name"]
        
        XCTAssertTrue(searchByCityNameTextField.exists)
        searchByCityNameTextField.tap()
        searchByCityNameTextField.typeText("Cairo")
        
        let searchButton = app.children(matching: .window).element(boundBy: 0).buttons["Search"]
        
        XCTAssertTrue(searchButton.exists)
        searchButton.tap()
        
        let placholderText = app.staticTexts["Enter City Name"]
        XCTAssertTrue(placholderText.exists)
        
        searchByCityNameTextField.tap()
        searchByCityNameTextField.typeText("it's Not a Correct City Name")
        searchButton.tap()
        let emptyListTable = app.tables["Empty list"]
        XCTAssertTrue(emptyListTable.exists)
        emptyListTable.tap()
    }
    
    func testGetting_Local_Weather_Case_Non_Sensetive_Search_And_AccuracyLable(){
        
        let app = XCUIApplication()
        app.launch()
        
        let searchByCityNameTextField = app.textFields["Search By City Name"]
        
        XCTAssertTrue(searchByCityNameTextField.exists)
        searchByCityNameTextField.tap()
        searchByCityNameTextField.typeText("as")
        
        let searchButton = app.children(matching: .window).element(boundBy: 0).buttons["Search"]
        XCTAssertTrue(searchButton.exists)
        searchButton.tap()
        
        let notAccurateDataStaticText = app.staticTexts["Not Accurate Data"]
        let _ =  notAccurateDataStaticText.waitForExistence(timeout: 3)
        XCTAssertTrue(notAccurateDataStaticText.exists,"you must be in offline mode or in any network error")
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

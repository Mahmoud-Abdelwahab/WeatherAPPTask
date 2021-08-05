//
//  WeatherAPPTaskTests.swift
//  WeatherAPPTaskTests
//
//  Created by Mahmoud Abdul-Wahab on 03/08/2021.
//

import XCTest
@testable import WeatherAPPTask

class WeatherAPPTaskTests: XCTestCase {
    
    let localRepository    = LocalSearchWorker()
    let remoteRepository   = RemoteSearchWorker()
    let cityName = "Cairo"
    let guessCount = 16
    var count = 0
    var currentCityName = ""
    
    
    func test_Weather_Response_count(){
        
        let countExpectation = expectation(description: "the list count = 16")
        remoteRepository.weatherSearchByCityName(cityName: cityName) {[weak self] response, error in
            guard let self = self else {return}
            
            guard let response = response else{
                self.localRepository.addCountryWeather(localWeather:  AppHelper.mappingRemoteWeatherToLocalWeather(weatherResponse: response!))
                return
            }
            self.count = response.list.count
            countExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 10) { error in
            XCTAssertEqual(self.count, self.guessCount, "Response count must be 16")
        }
        
    }
    
    func test_Local_Weather_Response(){
        let cairoWeatherExpectation = expectation(description: "Cairo weather found in cash")
        
        localRepository.weatherSearchByCityName(cityName: cityName) {[weak self] result, error in
            guard let self = self else {return}
            guard let result = result else{
                return
            }
            print(result)
            self.currentCityName = result.cityName
            cairoWeatherExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 70) { error in
            XCTAssertEqual(self.currentCityName, self.cityName, "Cairo weather not found")
        }
        
    }
    
    
    func testExample() throws {}
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}

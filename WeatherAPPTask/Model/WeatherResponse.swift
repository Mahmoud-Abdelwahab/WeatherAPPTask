//
//  WeatherResponse.swift
//  WeatherAPPTask
//
//  Created by Mahmoud Abdul-Wahab on 03/08/2021.
//

import Foundation


// MARK: - WeatherResponse
struct WeatherResponse: Codable {
    let cod: String?
    let message: Int?
    let list: [List]?
}

// MARK: - List
struct List: Codable {
    let main: Main?
    let weather: [Weather]?
    let dtTxt: String?

    enum CodingKeys: String, CodingKey {
        case main, weather
        case dtTxt = "dt_txt"
    }
}

// MARK: - Main
struct Main: Codable {
    let temp: Double?
    let humidity: Int?
}

// MARK: - Weather
struct Weather: Codable {
    let  weatherDescription: String?

    enum CodingKeys: String, CodingKey {
        case weatherDescription = "description"
    }
}


struct WeatherVM {
    var cityName: String?
    var temp: Double?
    var humidity: Int?
    var weatherDescription: String?
    var dtTxt: String?
    
    init(list: List,cityName: String) {
        self.cityName           = cityName
        self.temp               = list.main?.temp
        self.humidity           = list.main?.humidity
        self.weatherDescription = list.weather?.first?.weatherDescription
        self.dtTxt              = list.dtTxt
    }
}

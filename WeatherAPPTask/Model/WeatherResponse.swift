//
//  WeatherResponse.swift
//  WeatherAPPTask
//
//  Created by Mahmoud Abdul-Wahab on 04/08/2021.
//

import Foundation

// MARK: - WeatherResponse
struct WeatherResponse: Codable {
    var list =  [WeatherList]()
    var city: City?
}

// MARK: - City
struct City: Codable {
    var name: String?
}

// MARK: - List
struct WeatherList: Codable {
    var main: Main?
    var weather: [Weather]?
    var dtTxt: String?

    enum CodingKeys: String, CodingKey {
        case main, weather
        case dtTxt = "dt_txt"
    }
}

// MARK: - Main
struct Main: Codable {
    var temp: Double?
    var humidity: Int?
}

// MARK: - Weather
struct Weather: Codable {
    var weatherDescription: String?

    enum CodingKeys: String, CodingKey {
        case weatherDescription = "description"
    }
}

//
//  WeatherVM.swift
//  WeatherAPPTask
//
//  Created by Mahmoud Abdul-Wahab on 04/08/2021.
//

import Foundation

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

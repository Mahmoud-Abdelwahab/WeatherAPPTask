//
//  WeatherVM.swift
//  WeatherAPPTask
//
//  Created by Mahmoud Abdul-Wahab on 04/08/2021.
//

import Foundation

struct WeatherCellVM {
    var temp: String?
    var humidity: String?
    var weatherDescription: String?
    var dtTxt: String?
    
    init(list: List) {
        self.temp               = "\(list.main?.temp ?? 0.0)º"
        self.humidity           = "\(list.main?.humidity ?? 0)"
        self.weatherDescription = list.weather?.first?.weatherDescription
        self.dtTxt              = list.dtTxt?.toTimeFormat()
    }
}

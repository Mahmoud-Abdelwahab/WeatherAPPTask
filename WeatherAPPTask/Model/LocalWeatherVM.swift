//
//  LocalWeatherVM.swift
//  WeatherAPPTask
//
//  Created by Mahmoud Abdul-Wahab on 04/08/2021.
//


import Foundation
import RealmSwift

class LocalWeather: Object{
    
    @objc dynamic var cityName: String = ""
    var weatherList = List<SingleLocalWeather>()
}


class SingleLocalWeather: Object {
    @objc dynamic  var temp: Double               = 0.0
    @objc dynamic  var humidity: Int              = 0
    @objc dynamic  var weatherDescription: String = ""
    @objc dynamic  var dtTxt: String              = ""
    
    override init() {
        self.temp               = 0.0
        self.humidity           = 0
        self.weatherDescription = ""
        self.dtTxt              = ""
    }
    init( temp: Double, humidity: Int, status: String, dateTxt: String) {
        self.temp               = temp
        self.humidity           = humidity
        self.weatherDescription = status
        self.dtTxt              = dateTxt
    }
}



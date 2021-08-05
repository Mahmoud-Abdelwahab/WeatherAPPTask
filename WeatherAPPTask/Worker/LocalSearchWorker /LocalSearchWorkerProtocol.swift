//
//  LocalSearchWorkerProtocol.swift
//  WeatherAPPTask
//
//  Created by Mahmoud Abdul-Wahab on 04/08/2021.
//


import Foundation
protocol LocalSearchWorkerProtocol {
    var  localManager: RealmManger { get }
    
    func addCountryWeather(localWeather: LocalWeather)
    func weatherSearchByCityName(cityName: String,completionHandler: @escaping (LocalWeather?, String?) -> Void)
    
}

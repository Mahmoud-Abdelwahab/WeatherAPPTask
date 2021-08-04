//
//  LocalSearchWorker.swift
//  WeatherAPPTask
//
//  Created by Mahmoud Abdul-Wahab on 04/08/2021.
//

import Foundation

class LocalSearchWorker {
    var  localManager =   RealManger.shared
}

extension LocalSearchWorker: LocalSearchWorkerProtocol{
    
    func addCountryWeather(localWeather: LocalWeather) {
        localManager.addCountryWeather(localWeather: localWeather)
    }

    func weatherSearchByCityName(cityName: String,completionHandler:@escaping (LocalWeather?, String?) -> Void){
        localManager.searchByCityName(for: cityName, completed: completionHandler)
    }
}

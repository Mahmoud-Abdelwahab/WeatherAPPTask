//
//  RemoteSearchWorker.swift
//  WeatherAPPTask
//
//  Created by Mahmoud Abdul-Wahab on 04/08/2021.
//

class RemoteSearchWorker {
    var  manager =   NetworkManager.shared
}

extension RemoteSearchWorker: RemoteSearchWorkerProtocol{
    
    func weatherSearchByCityName(cityName: String,completionHandler:@escaping (WeatherResponse?, String?) -> Void){
        manager.searchByCityName(for: cityName, completed: completionHandler)
    }
}

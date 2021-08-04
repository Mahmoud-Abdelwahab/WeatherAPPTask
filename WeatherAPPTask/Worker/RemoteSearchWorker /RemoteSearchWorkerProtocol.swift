//
//  RemoteSearchWorkerProtocol.swift
//  WeatherAPPTask
//
//  Created by Mahmoud Abdul-Wahab on 04/08/2021.
//

import Foundation
protocol RemoteSearchWorkerProtocol {
     var  manager: NetworkManager { get }

    func weatherSearchByCityName(cityName: String,completionHandler: @escaping (WeatherResponse?, String?) -> Void)
}

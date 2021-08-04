//
//  WeatherInteractor.swift
//  WeatherAPPTask
//
//  Created by Mahmoud Abdul-Wahab on 03/08/2021.
//

import Foundation

class WeatherInteractor {
    weak var presenter: WeatherInteractorOutputProtocol?
    var remoteSearchWorker: RemoteSearchWorkerProtocol?
}

extension WeatherInteractor: WeatherInteractorInputProtocol{
    
    func doSearch(with cityName: String) {
        remoteSearchWorker?.weatherSearchByCityName(cityName: cityName){[weak self] response , error in
                guard let self = self else {return}
            guard let response = response else{
                self.presenter?.weatherFetchingFailed(with: error!)
                return
            }
            self.presenter?.weatherListFetchedSuccessfully(weather: response)
            }
        }
}

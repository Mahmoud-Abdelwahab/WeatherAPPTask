//
//  WeatherInteractor.swift
//  WeatherAPPTask
//
//  Created by Mahmoud Abdul-Wahab on 04/08/2021.
//

import Foundation

class WeatherInteractor {
    weak var presenter: WeatherInteractorOutputProtocol?
    var remoteSearchWorker: RemoteSearchWorkerProtocol?
    var localSearchWorker:  LocalSearchWorkerProtocol?
}

extension WeatherInteractor: WeatherInteractorInputProtocol{
    
    func remoteSearch(with cityName: String) {
        remoteSearchWorker?.weatherSearchByCityName(cityName: cityName){[weak self] response , error in
            guard let self = self else {return}
            guard let response = response else{
                error == AppError.invalidResponse.localizedDescription ?  self.presenter?.weatherFetchingFailed(with: error!): self.localSearch(with: cityName)
                return
            }
            self.presenter?.remoteWeatherListFetchedSuccessfully(weather: response)
            self.localSearchWorker?.addCountryWeather(localWeather: AppHelper.mappingRemoteWeatherToLocalWeather(weatherResponse: response))
        }
    }
    
    func localSearch(with cityName: String) {
        self.localSearchWorker?.weatherSearchByCityName(cityName: cityName){
            [weak self] response , error in
            guard let self = self else {return}
            guard let response = response else{
                self.presenter?.weatherFetchingFailed(with: error!)
                return
            }
            let weatherObject = AppHelper.mappingLocalWeatherToRemoteWeather(localWeather: response)
            self.presenter?.localWeatherListFetchedSuccessfully(weather: weatherObject)
        }
    }
    
}

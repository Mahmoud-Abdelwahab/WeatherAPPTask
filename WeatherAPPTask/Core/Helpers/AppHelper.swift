//
//  AppHelper.swift
//  WeatherAPPTask
//
//  Created by Mahmoud Abdul-Wahab on 04/08/2021.
//

import Foundation

enum AppHelper{
    
    static func mappingLocalWeatherToRemoteWeather(localWeather: LocalWeather)->WeatherResponse{
        var list = [WeatherList]()
        localWeather.weatherList.forEach {
            let object = WeatherList(main: Main(temp: $0.temp, humidity: $0.humidity), weather: [Weather(weatherDescription:$0.weatherDescription)], dtTxt: $0.dtTxt)
            list.append(object)
        }
        return WeatherResponse(list: list, city: City(name: localWeather.cityName))
    }
    
    static func mappingRemoteWeatherToLocalWeather(weatherResponse: WeatherResponse)->LocalWeather{
        let localWeather = LocalWeather()
        localWeather.cityName = weatherResponse.city?.name ?? ""
        weatherResponse.list.forEach{
            let weather = SingleLocalWeather(temp: $0.main?.temp ?? 0.0, humidity: $0.main?.humidity ?? 0, status: $0.weather?.first?.weatherDescription ?? "", dateTxt: $0.dtTxt?.toTimeFormat() ?? "")
            localWeather.weatherList.append(weather)
        }
        return localWeather
    }
    
}

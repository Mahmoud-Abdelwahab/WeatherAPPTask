//
//  NetworkLayer.swift
//  WeatherAPPTask
//
//  Created by Mahmoud Abdul-Wahab on 04/08/2021.
//

import Foundation

class NetworkManager {
    static let shared           = NetworkManager()
    private let baseURL         = Constant.baseURL
    private init(){}

    func  searchByCityName(for cityName : String ,completed: @escaping (WeatherResponse?, String?) -> Void)  {
        let endPoint  = baseURL + "?q=\(cityName)&appid=\(Constant.apiKey)&units=metric&cnt=16"

        guard let url = URL(string: endPoint) else {
            completed(nil, AppError.invalidURL.localizedDescription)
            return
        }

        let task = URLSession.shared.dataTask(with: url){data , response , error in
            
            if let error = error {
                completed( nil, error.localizedDescription)
                 return
            }

            guard let response = response as? HTTPURLResponse , response.statusCode == 200 else {
                completed(nil , AppError.invalidResponse.localizedDescription)
                return
            }

            guard let data = data else{
                completed(nil, AppError.invalidData.localizedDescription)
                return
            }

            do {
                let weatherResponse  = try JSONDecoder().decode(WeatherResponse.self, from: data)
                completed(weatherResponse, nil)
            }catch{
                completed(nil, AppError.jsonParsingFailure.localizedDescription)
            }
        }
        task.resume()
    }
}

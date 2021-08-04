//
//  WeatherRouterProtocol.swift
//  WeatherAPPTask
//
//  Created by Mahmoud Abdul-Wahab on 04/08/2021.
//

import Foundation

protocol WeatherViewProtocol:BaseViewControllerProtocol, AnyObject{
    var presenter: WeatherPresenterProtocol?{get set}
    var weatherListDataSource:[WeatherList]?{get set}
    
    func configureWeatherTableView()
    func configureUI(weatherList: [WeatherList])
    func configureDialogView(isHidden: Bool ,buttonIsHidden: Bool, message: String)
    func showHideDialog(isHidden: Bool)
    func showHideAccuracyLable(isHidden: Bool)
    func emptyView()
}

protocol WeatherPresenterProtocol:AnyObject{
    var view: WeatherViewProtocol?{get set}
    
    func viewDidLoad()
    func doSearch(with cityName: String?)
    func configueCell(cell: WeatherCellViewProtocol, weatherList: WeatherList?)
}

// Router
protocol WeatherRouterProtocol:BaseRouterProtocol {

}

// Interactor

protocol  WeatherInteractorInputProtocol {
    var presenter: WeatherInteractorOutputProtocol?{get set}
    var remoteSearchWorker: RemoteSearchWorkerProtocol?{get set}
    var localSearchWorker: LocalSearchWorkerProtocol?{get set}
    
    func remoteSearch(with cityName: String)
    func localSearch(with cityName: String)
    
}

protocol  WeatherInteractorOutputProtocol:AnyObject {
    func remoteWeatherListFetchedSuccessfully(weather: WeatherResponse)
    func localWeatherListFetchedSuccessfully(weather: WeatherResponse)
    func weatherFetchingFailed(with error: String)
}

// Cell

protocol WeatherCellViewProtocol {
   func configure(viewModel: WeatherCellVM)
}




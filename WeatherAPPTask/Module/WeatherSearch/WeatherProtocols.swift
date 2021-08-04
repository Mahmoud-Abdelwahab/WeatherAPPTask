//
//  WeatherRouterProtocol.swift
//  WeatherAPPTask
//
//  Created by Mahmoud Abdul-Wahab on 03/08/2021.
//

import Foundation

protocol WeatherViewProtocol:BaseViewControllerProtocol, AnyObject{
    var presenter: WeatherPresenterProtocol?{get set}
    var weatherListDataSource:[List]?{get set}
    
    func configureWeatherTableView()
    func configureUI(weatherList: [List])
    func configureDialogView(isHidden: Bool ,buttonIsHidden: Bool, message: String)
    func showHideDialog(isHidden: Bool)
    func emptyView()
}

protocol WeatherPresenterProtocol:AnyObject{
    var view: WeatherViewProtocol?{get set}
    
    func viewDidLoad()
    func doSearch(with cityName: String?)
    func configueCell(cell: WeatherCellViewProtocol, weatherList: List?)
}

// Router
protocol WeatherRouterProtocol:BaseRouterProtocol {

}

// Interactor

protocol  WeatherInteractorInputProtocol {
    var presenter: WeatherInteractorOutputProtocol?{get set}
    var remoteSearchWorker: RemoteSearchWorkerProtocol?{get set}
    
    func doSearch(with cityName: String)
    
}

protocol  WeatherInteractorOutputProtocol:AnyObject {
    func weatherListFetchedSuccessfully(weather: WeatherResponse)
    func weatherFetchingFailed(with error: String)
}

// Cell

protocol WeatherCellViewProtocol {
   func configure(viewModel: WeatherCellVM)
}




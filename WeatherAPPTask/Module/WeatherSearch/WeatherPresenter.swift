//
//  WeatherPresenter.swift
//  WeatherAPPTask
//
//  Created by Mahmoud Abdul-Wahab on 04/08/2021.
//

import Foundation

class WeatherPresenter{
    weak var view: WeatherViewProtocol?
    private var interactor: WeatherInteractorInputProtocol?
    private let router    : WeatherRouterProtocol?
    
    init(view: WeatherViewProtocol, interactor:WeatherInteractorInputProtocol,
         router: WeatherRouterProtocol)
    {
        self.view       = view
        self.interactor = interactor
        self.router     = router
    }
}

extension WeatherPresenter: WeatherPresenterProtocol,WeatherInteractorOutputProtocol{
    
    func viewDidLoad() {
      
    }
    
    func configueCell(cell: WeatherCellViewProtocol, weatherList: WeatherList?) {
        guard  let list = weatherList else {
            return
        }
        let weatherVM = WeatherCellVM(list: list)
        cell.configure(viewModel: weatherVM)
    }
     
    func doSearch(with cityName: String?){
        guard  let cityName = cityName , !cityName.isEmpty else {
            router?.showAlert(title: "Warning", message: "Please enter Search Key")
            return
        }
        view?.showLoadingIndicatore()
        interactor?.remoteSearch(with: cityName)
    }
    
    func remoteWeatherListFetchedSuccessfully(weather: WeatherResponse) {
        DispatchQueue.main.async {
            self.view?.hideLoadingIndicatore()
            self.view?.showHideDialog(isHidden: true)
            self.view?.configureUI(weatherList: weather.list)
            self.view?.showHideAccuracyLable(isHidden: true)
        }
    }
    
    func localWeatherListFetchedSuccessfully(weather: WeatherResponse){
        DispatchQueue.main.async {
            self.view?.hideLoadingIndicatore()
            self.view?.showHideDialog(isHidden: true)
            self.view?.configureUI(weatherList: weather.list)
            self.view?.showHideAccuracyLable(isHidden: false)
        }
    }

    
    func weatherFetchingFailed(with error: String) {
        DispatchQueue.main.async {
            self.view?.hideLoadingIndicatore()
         //   self.router?.showAlert(title: "Error", message: error)
            self.view?.showHideAccuracyLable(isHidden: true)
            self.view?.emptyView()
            self.view?.configureDialogView(isHidden: false, buttonIsHidden: false, message: error)
        }
    }
 
}



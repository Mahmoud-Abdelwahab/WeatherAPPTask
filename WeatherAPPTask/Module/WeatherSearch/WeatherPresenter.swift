//
//  WeatherPresenter.swift
//  WeatherAPPTask
//
//  Created by Mahmoud Abdul-Wahab on 03/08/2021.
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
    
 
}



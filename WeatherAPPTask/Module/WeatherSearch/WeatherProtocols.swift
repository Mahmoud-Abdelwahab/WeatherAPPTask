//
//  WeatherRouterProtocol.swift
//  WeatherAPPTask
//
//  Created by Mahmoud Abdul-Wahab on 03/08/2021.
//

import Foundation

protocol WeatherViewProtocol:BaseViewControllerProtocol, AnyObject{
    var presenter: WeatherPresenterProtocol?{get set}
}

protocol WeatherPresenterProtocol:AnyObject{
    var view: WeatherViewProtocol?{get set}
    
    func viewDidLoad()
   // func configueCell(cell: TeamCellViewProtocol, team: Team?)
}

// Router
protocol WeatherRouterProtocol:AnyObject {

}

// Interactor

protocol  WeatherInteractorInputProtocol {
    var presenter: WeatherInteractorOutputProtocol?{get set}
   // func getPremierLeagueTeamList()
}

protocol  WeatherInteractorOutputProtocol:AnyObject {
//    func teamListFetchedSuccessfully(teams: [Team])
//    func teamFetchingFailed(with error: String)
}

// Cell

protocol WeatherCellViewProtocol {
   
 //   func configure(viewModel: TeamListVM)
}




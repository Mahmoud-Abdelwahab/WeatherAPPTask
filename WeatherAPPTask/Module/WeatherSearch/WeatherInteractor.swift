//
//  WeatherInteractor.swift
//  WeatherAPPTask
//
//  Created by Mahmoud Abdul-Wahab on 03/08/2021.
//

import Foundation

class WeatherInteractor {
    weak var presenter: WeatherInteractorOutputProtocol?
   // var remoteLeagueTeamsWorker = RemoteLeagueTeamsWorker()
}

extension WeatherInteractor: WeatherInteractorInputProtocol{
    
 //   func getPremierLeagueTeamList() {
//        remoteLeagueTeamsWorker.getPremierLeagueTeamList {[weak self] result in
//            guard let self = self else{return}
//            switch result{
//            case .success(let teamList):
//                self.presenter?.teamListFetchedSuccessfully(teams: teamList.teams ?? [])
//            case .failure(let error):
//                self.presenter?.teamFetchingFailed(with: error)
//            }
//        }
//    }
}

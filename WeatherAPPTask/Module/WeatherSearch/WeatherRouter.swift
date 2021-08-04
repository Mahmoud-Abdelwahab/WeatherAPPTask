//
//  WeatherRouter.swift
//  WeatherAPPTask
//
//  Created by Mahmoud Abdul-Wahab on 03/08/2021.
//

import UIKit

class WeatherRouter {
    weak var viewController: UIViewController?
}

extension WeatherRouter: WeatherRouterProtocol{
    
    static func createModule()->UIViewController{
        let view                = WeatherVC()
        let interactor          = WeatherInteractor()
        let router              = WeatherRouter()
        let presenter           = WeatherPresenter(view: view, interactor: interactor, router: router)
        view.presenter          = presenter
        interactor.presenter    = presenter
        interactor.remoteSearchWorker = RemoteSearchWorker()
        router.viewController   = view
        return view
    }
    
    func showAlert(title: String, message: String) {
        viewController!.showAlert(title: title, message: message)
    }

}

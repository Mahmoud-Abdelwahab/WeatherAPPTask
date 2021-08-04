//
//  RealmManger.swift
//  WeatherAPPTask
//
//  Created by Mahmoud Abdul-Wahab on 04/08/2021.
//


import Foundation
import RealmSwift

class RealmManger {
    static let shared  = RealmManger()
   
    private init(){}

    func  searchByCityName(for cityName : String ,completed: @escaping (LocalWeather?, String?) -> Void)  {
        let predicate = NSPredicate(format: "cityName BEGINSWITH [c]%@", cityName)
         let realm = try! Realm()
              guard let searchResults =  realm.objects(LocalWeather.self).filter(predicate).first else{
                completed(nil,"No Weather Found")
                return
            }
             completed(searchResults,nil)
    }
    
    func addCountryWeather(localWeather: LocalWeather){
        do {
            let realm = try Realm()
            try! realm.write {
                realm.add(localWeather)
            }
        } catch let error as NSError {
              print(error)
        }
    }
}

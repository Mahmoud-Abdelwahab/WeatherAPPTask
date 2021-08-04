//
//  WeatherVC.swift
//  WeatherAPPTask
//
//  Created by Mahmoud Abdul-Wahab on 04/08/2021.
//

import UIKit

class WeatherVC: UIViewController {

    @IBOutlet weak var notAcuurateDataLable: UILabel!
    @IBOutlet weak var dialogMessageLable: UILabel!
    @IBOutlet weak var retryButton: UIButton!
    @IBOutlet weak var dialogView: UIView!
    @IBOutlet weak var searchTF: UITextField!
    @IBOutlet weak var weatherTableView: UITableView!
    
    var presenter: WeatherPresenterProtocol?
    var weatherListDataSource: [WeatherList]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        configureWeatherTableView()
    
    }

    @IBAction func didTapSearchBtn(_ sender: Any) {
        presenter?.doSearch(with: searchTF.text)
    }
    
    @IBAction func didTapRetryBtn(_ sender: Any) {
        presenter?.doSearch(with: searchTF.text)
    }
    
}



extension WeatherVC: WeatherViewProtocol{

    func configureWeatherTableView(){
        searchTF.addTarget(self, action: #selector(textFieldDidChange(_:)),
                                  for: .editingChanged)
        
        weatherTableView.dataSource   = self
        weatherTableView.register(WeatherCell.nib(), forCellReuseIdentifier: WeatherCell.identifier)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if textField.text == ""{
            emptyView()
            showHideAccuracyLable(isHidden: true)
            configureDialogView(isHidden: false, buttonIsHidden: true, message: "Enter City Name")
        }
    }
    
    func showLoadingIndicatore() {
        print("Should Show Loading Indicator")
        startActivityIndicator()
    }
    
    func hideLoadingIndicatore() {
        print("Should Hide Loading Indicator")
        stopActivityIndicator()
    }
    
    func configureUI(weatherList: [WeatherList]){
        self.weatherListDataSource = weatherList
        weatherTableView.reloadData()
    }
    
    func showHideDialog(isHidden: Bool){
        dialogView.isHidden = isHidden
    }
    
    func configureDialogView(isHidden: Bool = true, buttonIsHidden: Bool = true , message: String = "") {
        dialogView.isHidden     = isHidden
        retryButton.isHidden    = buttonIsHidden
        dialogMessageLable.text = message
    }
    
    func emptyView() {
        weatherListDataSource?.removeAll()
        weatherTableView.reloadData()
    }
    
    func showHideAccuracyLable(isHidden: Bool){
        notAcuurateDataLable.isHidden = isHidden
    }
}

extension WeatherVC: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        weatherListDataSource?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = weatherTableView.dequeueReusableCell(withIdentifier: WeatherCell.identifier) as! WeatherCell
        presenter?.configueCell(cell: cell, weatherList: weatherListDataSource?[indexPath.row])
        return cell
    }
    
}


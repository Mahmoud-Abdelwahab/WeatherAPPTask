//
//  WeatherVC.swift
//  WeatherAPPTask
//
//  Created by Mahmoud Abdul-Wahab on 03/08/2021.
//

import UIKit

class WeatherVC: UIViewController {

    @IBOutlet weak var notAcuurateDataLable: UILabel!
    @IBOutlet weak var retryButton: UIButton!
    @IBOutlet weak var dialogView: UIView!
    @IBOutlet weak var searchTF: UITextField!
    
    @IBOutlet weak var weatherTableView: UITableView!
    
    var presenter: WeatherPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func didTapSearchBtn(_ sender: Any) {
        
    }
    
}



extension WeatherVC: WeatherViewProtocol{
    
    
    func configureTeamsTableView(){
        weatherTableView.dataSource   = self
       // weatherTableView.register(TeamCell.nib(), forCellReuseIdentifier: TeamCell.identifier)
    }
    
    func reloadTeamListTableView() {
       
    }
    
    func showLoadingIndicatore() {
        print("Should Show Loading Indicator")
        startActivityIndicator()
    }
    
    func hideLoadingIndicatore() {
        print("Should Hide Loading Indicator")
        stopActivityIndicator()
    }
    
//    func configureUI(teams: [Team]){
//        self.teamsDataSource = teams
//        teamsTableView.reloadData()
//    }
}

extension WeatherVC:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // teamsDataSource?.count ?? 0
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = teamsTableView.dequeueReusableCell(withIdentifier: TeamCell.identifier) as! TeamCell
//        presenter?.configueCell(cell: cell, team: teamsDataSource?[indexPath.row])
        //       return cell
        UITableViewCell()
    }
    
}


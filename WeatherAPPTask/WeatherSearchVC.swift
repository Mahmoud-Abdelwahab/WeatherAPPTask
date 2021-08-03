//
//  WeatherSearchVC.swift
//  WeatherAPPTask
//
//  Created by Mahmoud Abdul-Wahab on 03/08/2021.
//

import UIKit

class WeatherSearchVC: UIViewController {

    @IBOutlet weak var notAcuurateDataLable: UILabel!
    @IBOutlet weak var retryButton: UIButton!
    @IBOutlet weak var dialogView: UIView!
    @IBOutlet weak var searchTF: UITextField!
    
    @IBOutlet weak var weatherTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func didTapSearchBtn(_ sender: Any) {
        
    }
    
}


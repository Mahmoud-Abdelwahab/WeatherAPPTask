//
//  WeatherCell.swift
//  WeatherAPPTask
//
//  Created by Mahmoud Abdul-Wahab on 04/08/2021.
//

import UIKit

class WeatherCell: UITableViewCell {
    static let identifier = "WeatherCell"

    @IBOutlet weak var humidityLable: UILabel!
    @IBOutlet weak var statusLable: UILabel!
    @IBOutlet weak var temptetureLable: UILabel!
    @IBOutlet weak var houreLable: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    static func nib()->UINib{
        UINib(nibName: WeatherCell.identifier, bundle: Bundle.main)
    }
    
}

extension WeatherCell: WeatherCellViewProtocol{
    func configure(viewModel: WeatherCellVM) {
        temptetureLable.text    = "Temp: \(viewModel.temp ?? "0")"
        statusLable.text        = "Status: \(viewModel.weatherDescription ?? "")"
        humidityLable.text      = "Humidity: \(viewModel.humidity ?? "")"
        houreLable.text         = "Time: \(viewModel.dtTxt ?? "")"
    }
}

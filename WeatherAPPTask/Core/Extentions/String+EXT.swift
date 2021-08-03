//
//  String+EXT.swift
//  WeatherAPPTask
//
//  Created by Mahmoud Abdul-Wahab on 03/08/2021.
//

import Foundation

extension String{
    func toTimeFormat() -> Self {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateFormatter.locale = Locale(identifier: "en")
        guard let date = dateFormatter.date(from: self) else { return "" }
        dateFormatter.dateFormat = "h:mm a"
        return dateFormatter.string(from: date)
    }
}

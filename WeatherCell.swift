//
//  WeatherCell.swift
//  wetterApp
//
//  Created by Florian Schuch on 25.04.17.
//  Copyright © 2017 Florian Schuch. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherType: UILabel!
    @IBOutlet weak var highTemp: UILabel!
    @IBOutlet weak var lowTemp: UILabel!
    
    
    func configureCell(forecast:Forecast) {
        weatherType.text = forecast.weatherType
        highTemp.text = "\(forecast.highTemp)"
        lowTemp.text = "\(forecast.lowTemp)"
        dayLabel.text = forecast.date
        weatherIcon.image = UIImage(named: forecast.weatherType)
    }
    
    




}

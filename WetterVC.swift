//
//  WetterVC.swift
//  wetterApp
//
//  Created by Florian Schuch on 14.04.17.
//  Copyright © 2017 Florian Schuch. All rights reserved.
//

import UIKit
import Alamofire

class WetterVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

//  IBOutlets
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var currentWeatherTypeLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var currentWeather: CurrentWeather!
    var forecast: Forecast!
    var forecasts = [Forecast]()


  
//  Setup UI to download data

    
    override func viewDidLoad() {
        super.viewDidLoad()

//      table view: dataSource and delegate declared
        tableView.delegate = self
        tableView.dataSource = self
        
// DownloadData
        currentWeather = CurrentWeather()


        currentWeather.downloadWeatherDetails {
            self.downloadForecastData {
            
            self.updateMainUI()
        }
    }
    }
    
//    Download Forecast Information
    func downloadForecastData(completed: @escaping DownloadComplete) {
        
        Alamofire.request(FORECAST_URL).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let list = dict["list"] as? [Dictionary<String, AnyObject>] {
                    
                    for obj in list {
                        let forecast = Forecast(weatherDict: obj)
                        self.forecasts.append(forecast)
                        print(obj)
                    }
                }
                
            }
            
            completed()
            
        }
        
    }
    

//  Necassary Functions for setting up the table view (how many sections, how many rows and who the dequeuable cell should be
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        
        return cell
    }
    
    func updateMainUI() {
        dateLabel.text = currentWeather.date
        currentTempLabel.text = "\(currentWeather.currentTemp)"
        locationLabel.text = currentWeather.cityName
        currentWeatherTypeLabel.text = currentWeather.weatherType
        currentWeatherImage.image = UIImage(named: currentWeather.weatherType)
    }
    
}


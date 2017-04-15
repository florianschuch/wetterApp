//
//  CurrentWeather.swift
//  wetterApp
//
//  Created by Florian Schuch on 15.04.17.
//  Copyright © 2017 Florian Schuch. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
    var _cityName: String!
    var _date: String!
    var _weatherType: String!
    var _currentTemp: Double!
 
//  If no data is received, it should display an empty string otherwise the app will crash.
    var cityName:String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }

    var date: String {
        if _date == nil {
            _date = ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Heute, \(currentDate)"
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }

//  Download current weather data
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {

        Alamofire.request(CURRENTS_WEATHER_URL).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let name = dict["name"] as? String {
                    
                    self._cityName = name.capitalized
                    
                    print(self._cityName)
                }
                
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
                    
                    if let main = weather[0]["main"] as? String {
                        
                        self._weatherType = main.capitalized
                        
                        print(self._weatherType)
                    }
                }
                
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
                    
                    if let currentTemperatur = main["temp"] as? Double {
                        
                        let KelvinToCelsius = Double(round(currentTemperatur - 273.15))
                        
                        self._currentTemp = KelvinToCelsius
                        
                        print(self._currentTemp)
                    }
                }
                
            }
        }
        completed()
    }
}


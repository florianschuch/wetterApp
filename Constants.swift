//
//  Constants.swift
//  wetterApp
//
//  Created by Florian Schuch on 15.04.17.
//  Copyright © 2017 Florian Schuch. All rights reserved.
//

import Foundation

// Download URL
let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATTITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "1d121c3e2c29a5375510c9e433e30e66"

typealias DownloadComplete = () -> ()

let CURRENTS_WEATHER_URL = "\(BASE_URL)\(LATTITUDE)35\(LONGITUDE)139\(APP_ID)\(API_KEY)"

//Forecast URL

let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=35&lon=139&cnt=10&appid=1d121c3e2c29a5375510c9e433e30e66"

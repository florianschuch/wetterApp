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

let CURRENTS_WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather?lat=137&lon=42&appid=1d121c3e2c29a5375510c9e433e30e66"

//Forecast URL

let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=137&lon=42&cnt=10&appid=1d121c3e2c29a5375510c9e433e30e66"

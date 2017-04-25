//
//  Location.swift
//  wetterApp
//
//  Created by Florian Schuch on 25.04.17.
//  Copyright © 2017 Florian Schuch. All rights reserved.
//

import CoreLocation

class Location {
    static var sharedInstance = Location()
    private init() {}
    
    var latitude: Double!
    var longitude: Double!
}

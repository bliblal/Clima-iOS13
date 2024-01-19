//
//  WeatherManager.swift
//  Clima
//
//  Created by Bilal Javed on 19/01/2024.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    var city = ""
    
    var weatherURL = "https://api.openweathermap.org/data/2.5/weather?q=islamabad&appid=d7ead00526eb3a207f1332871cca99c2&units=metric"
    
    func fetchWeather(city: String){
        var finalURL = "\(weatherURL)&q=\(city)"
        print(finalURL)
    }
}

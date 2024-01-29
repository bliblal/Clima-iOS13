//
//  WeatherModel.swift
//  Clima
//
//  Created by Bilal Javed on 26/01/2024.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation


struct WeatherModel{
    var conditionId: Int
    var cityName: String
    var temprature: Double
    
    var condition: String {
        switch conditionId{
        case 200...232:
            return "cloud.bolt.rain"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.heavyrain"
        case 600...622:
            return "snow"
        case 700...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud"
        default:
            return "sun.max"
        }
    }
    
    var tempString: String {
        return String(format: "%.1f", temprature)
    }
    
}

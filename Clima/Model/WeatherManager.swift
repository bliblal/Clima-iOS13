//
//  WeatherManager.swift
//  Clima
//
//  Created by Bilal Javed on 19/01/2024.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weathermanager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    
    var defaultweather = WeatherModel(conditionId: 801, cityName: "Error", temprature: 0.00)
    
    var delegate: WeatherManagerDelegate?
    
    var weatherURL = "https://api.openweathermap.org/data/2.5/weather?&appid=d7ead00526eb3a207f1332871cca99c2&units=metric"
    
    func fetchWeather(_ city: String, _  units: String = "metric"){
        let finalURL = "\(weatherURL)&q=\(city)"
        print(finalURL)
        performCall(url: finalURL)
    }
    
    func fetchWeathercoord(_ lat: CLLocationDegrees, _ lon: CLLocationDegrees , _ units: String = "metric"){
        let finalURL = "\(weatherURL)&lat=\(lat)&lon=\(lon)"
        print(finalURL)
        performCall(url: finalURL)
    }
    
    func performCall(url: String){
        //create url
        if let url = URL(string: url){
            //create a session
            let session = URLSession(configuration: .default)
            
            //create a task (trailing closure used here)
            let task = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
                if (error != nil) {
                    delegate?.didFailWithError(error: error!)
                    return
                }
                if let safedata = data {
                    let weatherdata = pasreJSON(data: safedata)
                    delegate?.didUpdateWeather(self, weather: weatherdata ?? defaultweather)
                }
            }
            
            //start the task
            task.resume()
        }
    }
    
    func pasreJSON(data: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodeddata = try decoder.decode(WeatherData.self, from: data)
            let weathermodel = WeatherModel(conditionId: decodeddata.weather[0].id, cityName: decodeddata.name, temprature: decodeddata.main.temp)
            return weathermodel
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
            
        }
    }
    
}

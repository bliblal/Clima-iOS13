//
//  WeatherManager.swift
//  Clima
//
//  Created by Bilal Javed on 19/01/2024.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(weather: WeatherModel)
}

struct WeatherManager {
    
    var delegate: WeatherManagerDelegate?
    
    var weatherURL = "https://api.openweathermap.org/data/2.5/weather?&appid=d7ead00526eb3a207f1332871cca99c2&units=metric"
    
    func fetchWeather(_ city: String, _  units: String = "metric"){
        let finalURL = "\(weatherURL)&q=\(city)"
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
                    print(error!)
                    return
                }
                if let safedata = data {
                    let weatherdata = pasreJSON(data: safedata)
                    delegate?.didUpdateWeather(weather: weatherdata!)
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
            print(error)
            return nil
            
        }
    }
    
}

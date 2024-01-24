//
//  WeatherManager.swift
//  Clima
//
//  Created by Bilal Javed on 19/01/2024.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    
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
                    pasreJSON(data: safedata)
                }
            }
            
            //start the task
            task.resume()
        }
    }
    
    func pasreJSON(data: Data){
        let decoder = JSONDecoder()
        do {
            let decodeddata = try decoder.decode(WeatherData.self, from: data)
            print(decodeddata.name)
        } catch {
            print(error)
        }
    }
    
    
    //completion handler function
    
}

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let weatherData = try? JSONDecoder().decode(WeatherData.self, from: jsonData)

import Foundation

// MARK: - WeatherData
struct WeatherData: Decodable {
    let weather: [Weather]
    let main: Main
    let visibility: Int
    let dt: Int
    let sys: Sys
    let timezone: Int
    let name: String
    let cod: Int
}


// MARK: - Main
struct Main: Decodable {
    let temp: Double
    let pressure: Int
    let humidity: Int
}

// MARK: - Sys
struct Sys: Decodable {
    let country: String
}

// MARK: - Weather
struct Weather: Decodable {
    let id: Int
    let main: String
}


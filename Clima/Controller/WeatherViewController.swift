//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, WeatherManagerDelegate {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    var weathermanager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchTextField.delegate = self
        weathermanager.delegate = self
    }

    @IBAction func searchButtonPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
    }
    
    
    
}



extension WeatherViewController: UITextFieldDelegate {
    
    //MARK: -TEXT FIELD ENTER PRESSED
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    
    //MARK: - TEXTFIELD SHOULD END EDITING
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        }
        else {
            textField.placeholder = "Enter a city"
            return false
        }
    }
    
    
    //MARK: -TEXT FIELD DID END EDITING
    func textFieldDidEndEditing(_ textField: UITextField) {
        //do something with city name here
        weathermanager.fetchWeather(searchTextField.text!, "imperial")
        searchTextField.text = ""
    }
    
    func didUpdateWeather(weather: WeatherModel){
        print(weather.cityName)
        
    }
    
    
    
    
}


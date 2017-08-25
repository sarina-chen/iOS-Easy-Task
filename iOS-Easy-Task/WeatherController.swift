//
//  WeatherController.swift
//  iOS-Easy-Task
//
//  Created by Sarina Chen on 2017-08-24.
//  Copyright © 2017 Sc. All rights reserved.
//

import Foundation

class WeatherController{

    private let owmAPI = "https://api.openweathermap.org/data/2.5/weather?q="
    private let owmKey = "8e8d20c83edd8038c94c2e3c84e9e688"
    private var temp:Double = -10000
    
    func getWeatherJSON(city: String){
        let session = URLSession.shared
        let weatherRequestURL = URL(string: "\(owmAPI)\(city)&APPID=\(owmKey)&units=metric")!
        
        let dataTask = session.dataTask(with: weatherRequestURL) { (jsonData, response, error) in
            if let error = error{
                print("Error:\n\(error)")
            }else{
                let weather = try? JSONSerialization.jsonObject(with: jsonData!, options: []) as! [String: AnyObject]
                print("Temperature: \(weather?["main"]!["temp"]!! ?? "Error")")
                self.temp = weather?["main"]!["temp"]!! as! Double
            }
        }
        dataTask.resume()
    }
    
    func getTemp()->String{
        if (temp == -10000){
            return String("An error has occurred")
        }else{
            return String(self.temp) +  " Celsius"
        }
        
    }

}

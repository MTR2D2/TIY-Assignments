//
//  WeatherConditions.swift
//  Forecaster
//
//  Created by Michael Reynolds on 10/29/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

struct WeatherConditions
{
    let temperature: String
    let feelsLike: String
    
    init(temp: String, feelsLike: String)
    {
        self.temperature = temp
        self.feelsLike = feelsLike
      
    }
    
    static func weatherWithJSON(results: NSDictionary) -> WeatherConditions
    {
        var weather: WeatherConditions
        var temperature = ""
        var feelsLike = ""
        
        if results.count > 0
        {
 //           if let currently = results["currently"] as? NSDictionary
 //           {
                temperature = String(results["temperature"] as! Double)
            
                feelsLike = String(results["apparentTemperature"] as! Double)
 //           }
        }
        
        weather = WeatherConditions(temp: temperature, feelsLike: feelsLike)
        
        return weather
    }
    
}

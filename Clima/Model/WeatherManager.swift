//
//  WeatherManager.swift
//  Clima
//
//  Created by Nyade on 11/05/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=f7ff04497946561b2f78f0461edd56a2&units=metric"
    
    func fetchWeather(cityName: String) {
        
        let urlString = "\(weatherURL)&q=\(cityName)"
        
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        
        //1. Create a URL
        if let url = URL(string: urlString) {
            //2. Create a URLSession
            let session = URLSession(configuration: .default)
            //3. Give the session a task
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    self.parseJSON(weatherData: safeData)
                }
            }
            //4. Start the task
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data) {
        let decoder = JSONDecoder()
        
    }
    
}

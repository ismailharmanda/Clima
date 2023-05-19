//
//  WeatherManager.swift
//  Clima
//
//  Created by ismail harmanda on 18.05.2023.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=1e6090d51e842b9d6ee0fd3ce3186a75&units=metric"
    
    func fetchManager(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String){
        
        // 1. Create a URL
        if let url = URL(string: urlString){
            
            // 2. Create a URLSession
            let session = URLSession(configuration: .default)
            
            // 3. Give the session a task
            let task = session.dataTask(with: url) { data, response, error in
                
                if error != nil {
                    print(error!)
                }
                if let safeData = data {
                    let dataString = String(data: safeData, encoding: .utf8)
                    print(dataString!)
                }
            }
            // 4. Start the task
            task.resume()
        }
    }
    
    
}

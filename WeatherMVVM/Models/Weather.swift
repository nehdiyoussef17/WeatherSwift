//
//  Weather.swift
//  WeatherMVVM
//
//  Created by odc on 3/2/2022.
//

import Foundation

public struct Weather {
    let city: String
    let tempurature: String
    let description: String
   let icon: String
    
    init(response: APIResponse){
        city = response.name
        tempurature = "\(Int(response.main.temp))"
        description = response.weather.first?.description ?? ""
        icon = response.weather.first?.main ?? ""
    }
    
}

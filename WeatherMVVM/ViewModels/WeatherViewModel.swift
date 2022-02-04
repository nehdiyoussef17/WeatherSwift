//
//  WeatherViewModel.swift
//  WeatherMVVM
//
//  Created by odc on 3/2/2022.
//

import Foundation
 

private let defaultIcon = "❓"
private let iconMap = [
    "Drizzle" : "🌨",
    "Thunderstorm" : "⛈",
    "Rain" : "🌧",
    "Snow" : "❄️",
    "Clear" : "☀️",
    "Clouds" : "☁️",
]





public class WeatherViewModel: ObservableObject{
    @Published var cityName: String = "City Name"
    @Published var temperature: String = "--"
    @Published var weatherDescription: String = "--"
    @Published var weatherIcon: String = defaultIcon
    public let weatherService : WeatherService
    public init(weatherService : WeatherService){
        self.weatherService = weatherService
    }
    public func refresh() {
        weatherService.loadWeatherData{weather in
            DispatchQueue.main.async {
                self.cityName = weather.city
                self.temperature = "\(weather.tempurature)°C"
                self.weatherDescription = weather.description.capitalized
                self.weatherIcon = iconMap[weather.icon] ?? defaultIcon
                print(self.cityName,self.temperature,self.weatherDescription)
            }
        }
    }
}

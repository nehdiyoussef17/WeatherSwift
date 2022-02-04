//
//  WeatherService.swift
//  WeatherMVVM
//
//  Created by odc on 3/2/2022.
//

import Foundation
import SwiftUI
import CoreLocation



public final class WeatherService: NSObject{
    private let locationManager = CLLocationManager()
    private let APIKey = "9d050969d59ac99310767d78e3980ed7"
    private var completionHandler: ((Weather)-> Void)?     //weather is a model
    
    public override init(){
        super.init()
        locationManager.delegate = self
    }

    //escaping closure ?????
    public func loadWeatherData (_ completionHandler: @escaping((Weather)-> Void)) {
        self.completionHandler = completionHandler
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        //completionHandler(Weather(response: APIResponse(name: "eeee", main: APIMain(temp: 20), weather: [])))
    }
    // api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}

    private func makeDataRequest (forCoordinates coordinates: CLLocationCoordinate2D){
        guard let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(coordinates.latitude)&lon=\(coordinates.longitude)&appid=\(APIKey)&units=metric".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {return}
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let data = data else {return}
            
            do
            {
                
                 let response = try JSONDecoder().decode(APIResponse.self, from: data)
                print(response.weather.first?.main ?? "error")
                self.completionHandler?(Weather(response: response))
                
                
            }catch
            {
                print(error)
            }
            
            
        }.resume()
    }
}

extension WeatherService: CLLocationManagerDelegate {
    public func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations:[CLLocation]
    ){
        guard let location = locations.first else {return}
        
        makeDataRequest(forCoordinates: location.coordinate)
    }
    public func locationManager( _ manager: CLLocationManager,
                                 didFailWithError error: Error)
    {
        print("something went wrong\(error.localizedDescription)")
    }
    
}

struct APIResponse: Decodable{
    let name: String
    let main: APIMain
    let weather : [APIWeather]
    
}

struct APIMain: Decodable{
    let temp: Double
}

struct APIWeather: Decodable{
    let description: String
   let main: String
    
}

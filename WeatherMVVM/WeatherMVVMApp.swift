//
//  WeatherMVVMApp.swift
//  WeatherMVVM
//
//  Created by odc on 3/2/2022.
//

import SwiftUI

@main
struct WeatherMVVMApp: App {
    var body: some Scene {
        WindowGroup {
            let weatherService = WeatherService()
            let viewModel = WeatherViewModel(weatherService: weatherService)
            WeatherView(viewModel: viewModel)
        }
    }
}

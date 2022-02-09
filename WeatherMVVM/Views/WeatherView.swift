//
//  ContentView.swift
//  WeatherMVVM
//
//  Created by odc on 3/2/2022.
//

import SwiftUI

struct WeatherView: View {
    
    @ObservedObject var viewModel: WeatherViewModel
    
    @State public var isNight = false
    let Sun: String = "🌞"
    let Moon: String = "🌛"
    
    
    var body: some View {
        ZStack{
            BGView(topColor: isNight ? .black : .blue,
                   bottomColor: Color("LightBlue"))
            VStack(spacing: 110){
            HStack{
                Spacer()
                ButtonD(title:  isNight ? Sun : Moon,isNight: $isNight).padding(.top)
                .frame(alignment: .topLeading)}//Hstack
            
            Text(viewModel.cityName)
                .font(.system(size: 52, weight: .medium, design: .default))
                .foregroundColor(isNight ? .white : .black)
                
            Text(viewModel.temperature)
                .font(.system(size: 90))
                .bold()
                .foregroundColor(isNight ? .white : .black)
            Text(viewModel.weatherIcon)
                .font(.system(size: 92, weight: .medium, design: .default))
                
                
            Text(viewModel.weatherDescription).font(.system(size: 32, weight: .medium, design: .default)).foregroundColor(isNight ? .white : .black)
            
            
            
            
            
        }.frame(
            maxWidth: .infinity,
            maxHeight: .infinity
        ) //Vstack
        }.task {  //Zstack
            
            viewModel.refresh()

            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(viewModel: WeatherViewModel(weatherService: WeatherService()))
    }
}

struct BGView: View {
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}


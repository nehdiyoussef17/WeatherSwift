//
//  WeatherButton.swift
//  WeatherSwiftUI
//
//  Created by odc on 2/2/2022.
//

import SwiftUI

struct DarkModeButton: View {
    var title: String
    
    
    var body: some View {
        
            Text(title)
                .frame(width: 50, height: 50)
                .font(.system(size: 40, weight: .bold, design: .default))
                .cornerRadius(10)
        
    }
}

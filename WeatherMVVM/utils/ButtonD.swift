//
//  Button.swift
//  WeatherMVVM
//
//  Created by odc on 4/2/2022.
//

import Foundation
import SwiftUI

struct ButtonD: View {
    var title: String
    @Binding var isNight: Bool
    
    var body: some View {
        

Button
{
    isNight.toggle()
}
label:
    {
 
        Text(title)
            .frame(width: 50, height: 50)
            .font(.system(size: 40, weight: .bold, design: .default))
            .cornerRadius(10)
        
        
}
    }
    
}

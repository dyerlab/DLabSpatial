//                      _                 _       _
//                   __| |_   _  ___ _ __| | __ _| |__
//                  / _` | | | |/ _ \ '__| |/ _` | '_ \
//                 | (_| | |_| |  __/ |  | | (_| | |_) |
//                  \__,_|\__, |\___|_|  |_|\__,_|_.__/
//                        |_ _/
//
//         Making Population Genetic Software That Doesn't Suck
//
//  Copyright (c) 2021-2025 The Dyer Laboratory.  All Rights Reserved.
//
//  WeatherDataView.swift
//  Objectives
//
//  Created by Rodney Dyer on 3/2/25.
//

import SwiftUI


struct WeatherDataView: View {
    var weather: WeatherData
    
    var body: some View {
        HStack{
            Text(weather.icon)
            Image(systemName: weather.icon)
                .symbolRenderingMode(.palette)
                .foregroundStyle( weather.color1, weather.color2 )
        }
    }
}

#Preview("Random") {
    let weather = WeatherData.randomWeather
    WeatherDataView( weather: weather )
}

#Preview("All") {
    let allWeather = WeatherData.allWeathers
    VStack {
        ForEach( allWeather ) { item in
            WeatherDataView(weather: item )
        }
    }
}


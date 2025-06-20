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
//  WeatherData.swift
//  Objectives
//
//  Created by Rodney Dyer on 3/2/25.
//

import Foundation
import SwiftUI

/// A struct representing basic weather data, including icon, precipitation, humidity, and temperature.
public struct WeatherData: Codable, Identifiable {
    /// A unique identifier for the weather data.
    public var id = UUID()

    /// The name of the SF Symbol icon representing the weather condition.
    public var icon: String

    /// The amount of precipitation in millimeters.
    public var precip: Double

    /// The humidity percentage.
    public var humidity: Double

    /// The temperature in degrees Fahrenheit.
    public var temperature: Double

    /// Initializes a new instance of WeatherData with specified parameters.
    /// - Parameters:
    ///   - icon: A string representing the SF Symbol of the weather condition.
    ///   - precip: The amount of precipitation in millimeters.
    ///   - humidity: The humidity percentage.
    ///   - temperature: The temperature in degrees Fahrenheit.
    public init(icon: String, precip: Double, humidity: Double, temperature: Double) {
        self.icon = icon
        self.precip = precip
        self.humidity = humidity
        self.temperature = temperature
    }

    /// The primary color associated with the weather icon.
    var color1: Color {
        return colors[icon, default: [.primary, .primary] ].first!
    }

    /// The secondary color associated with the weather icon.
    var color2: Color {
        return colors[icon, default: [.primary, .primary] ].last!
    }

    /// A dictionary mapping SF Symbol icon names to their associated gradient colors.
    var colors: [String : [Color] ] {
        return [ "sun.min"          : [.yellow, .yellow ],
                 "sun.max"          : [.yellow, .yellow ],
                 "sun.horizon"      : [.secondary, .yellow ],
                 "sun.dust"         : [.brown, .yellow ],
                 "sun.haze"         : [.gray, .yellow ],
                 "sun.rain"         : [.blue, .yellow ],
                 "sun.snow"         : [.blue, .yellow ],
                 "cloud"            : [.gray, .primary],
                 "cloud.moon"       : [.gray, .secondary],
                 "cloud.sun"        : [.gray, .yellow ],
                 "cloud.drizzle"    : [.gray, .blue],
                 "cloud.rain"       : [.gray, .blue],
                 "cloud.heavyrain"  : [.gray, .blue],
                 "cloud.fog"        : [.gray, .secondary],
                 "cloud.snow"       : [.gray, .blue],
                 "cloud.hail"       : [.gray, .blue],
                 "cloud.sleet"      : [.gray, .blue],
                 "wind"             : [.blue, .blue],
                 "tropicalstorm"    : [.red, .primary],
        ]
    }
}

extension WeatherData: CustomStringConvertible {
    /// A textual representation of the weather data.
    public var description: String {
        return String("\(self.icon); \(self.precip) mm; \(self.humidity) %; \(self.temperature) °F")
    }
}

extension WeatherData {
    /// Returns an array of randomly generated WeatherData instances, one for each defined icon type.
    public static var allWeathers: [WeatherData] {
        let icon = [
            "sun.min",
            "sun.max",
            "sun.horizon",
            "sun.dust",
            "sun.haze",
            "sun.rain",
            "sun.snow",
            "cloud",
            "cloud.moon",
            "cloud.sun",
            "cloud.drizzle",
            "cloud.rain",
            "cloud.heavyrain",
            "cloud.fog",
            "cloud.snow",
            "cloud.hail",
            "cloud.sleet",
            "wind",
            "tropicalstorm"
        ]

        /// Returns an array of randomly generated WeatherData instances, one for each defined icon type.
        return icon.compactMap({
            WeatherData(icon: $0,
                        precip: Double.random(in: 0.0...10.0),
                        humidity: Double.random(in: 0.0...100.0),
                        temperature: Double.random(in: 0.0...100.0))
        })
    }

    /// Returns a single randomly selected WeatherData instance.
    public static var randomWeather: WeatherData {
        return allWeathers.randomElement()!
    }
}

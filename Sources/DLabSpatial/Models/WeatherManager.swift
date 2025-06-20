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
//  WeatherManager.swift
//  Objectives
//
//  Created by Rodney Dyer on 3/4/25.
//
//  A utility class for fetching and formatting current weather data using WeatherKit.
//  Designed for use on the main actor, it provides properties for temperature, humidity,
//  precipitation, and a weather icon for UI display.
//

import Foundation
@preconcurrency import WeatherKit

/// A class responsible for retrieving and formatting weather data using WeatherKit.
///
/// This class uses `WeatherService` to asynchronously fetch weather data based on
/// latitude and longitude coordinates. It exposes computed properties for display
/// elements such as icon, temperature, humidity, and precipitation, all adapted
/// for easy use in SwiftUI views or UI components. Runs on the `@MainActor`.
@MainActor
class WeatherManager {
    /// The WeatherKit service instance used for API access.
    private let weatherService = WeatherService()
    
    /// The current fetched weather data.
    var weather: Weather?
    
    /// The name of the SF Symbol representing current weather conditions.
    var icon: String {
        guard let iconName = weather?.currentWeather.symbolName else { return "" }
        return iconName
    }
    
    /// A structured summary of the current weather data for display.
    var weatherData: WeatherData? {
        if let data = weather {
            return WeatherData(icon: icon,
                               precip: data.currentWeather.precipitationIntensity.value,
                               humidity: data.currentWeather.humidity,
                               temperature: Double(data.currentWeather.temperature.value))
        } else {
            return nil
        }
    }
    
    /// Fetches the current weather conditions for a given latitude and longitude.
    /// - Parameters:
    ///   - lat: Latitude of the location.
    ///   - lon: Longitude of the location.
    func getWeather(lat: Double, lon: Double) async {
        if lat.isNaN || lon.isNaN { return }
        do {
            weather = try await weatherService.weather(for: .init(latitude: lat, longitude: lon))
        } catch {
            print("Failed to get weather data: \(error)")
        }
    }
    
    /// The current temperature in degrees Fahrenheit as a formatted string.
    var temperature: String {
        guard let temp = weather?.currentWeather.temperature else { return "" }
        let convert = temp.converted(to: .fahrenheit).value
        return String(Int(convert)) + "°F"
    }
    
    /// The current humidity percentage as a formatted string.
    var humidity: String {
        guard let humidity = weather?.currentWeather.humidity else { return "" }
        let computedHumidity = humidity * 100
        return String(Int(computedHumidity)) + "%"
    }
    
    /// The current precipitation intensity as a formatted string.
    var precip: String {
        guard let precip = weather?.currentWeather.precipitationIntensity else { return "" }
        return String("\(precip)")
    }
}

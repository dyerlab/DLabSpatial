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
//  DLabWeatherTests.swift
//  DLabSpatial
//
//  Created by Rodney Dyer on 6/20/25.
//

import Testing
@testable import DLabSpatial


@Test("WeatherData initializes correctly")
func testInitialization() throws {
    let data = WeatherData(icon: "cloud.rain", precip: 5.5, humidity: 80.0, temperature: 72.0)
    #expect(data.icon == "cloud.rain")
    #expect(data.precip == 5.5)
    #expect(data.humidity == 80.0)
    #expect(data.temperature == 72.0)
}

@Test("WeatherData description is formatted correctly")
func testDescriptionFormat() throws {
    let data = WeatherData(icon: "sun.max", precip: 2.0, humidity: 45.0, temperature: 88.0)
    #expect(data.description.contains("sun.max"))
    #expect(data.description.contains("2.0"))
    #expect(data.description.contains("45.0"))
    #expect(data.description.contains("88.0"))
}

@Test("WeatherData color1 and color2 return expected colors")
func testColors() throws {
    let data = WeatherData(icon: "sun.max", precip: 0.0, humidity: 0.0, temperature: 0.0)
    #expect(data.color1 == .yellow)
    #expect(data.color2 == .yellow)
}

@Test("WeatherData.allWeathers returns unique entries for each icon")
func testAllWeathers() throws {
    let weathers = WeatherData.allWeathers
    let icons = Set(weathers.map { $0.icon })
    
    weathers.forEach { print($0.description) }
    
    #expect(weathers.count == icons.count)
}

@Test("WeatherData.randomWeather returns a valid entry")
func testRandomWeather() throws {
    let random = WeatherData.randomWeather
    let icons = Set(WeatherData.allWeathers.map { $0.icon })
    #expect(icons.contains(random.icon))
}

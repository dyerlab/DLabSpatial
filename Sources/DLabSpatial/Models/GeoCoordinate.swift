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
//  GeoCoordinate.swift
//  DLabPopGraph
//
//  Created by Rodney Dyer on 5/21/25.
//

import Foundation
import CoreLocation


/// A basic structure that handles spatial coordiantes that can be serialized
public struct GeoCoordinate {
    
    /// Degrees (decimal) latitude
    public var latitude: Double
    /// Degrees (deciman) longitude
    public var longitude: Double
    
    /// Convience conversion to CLLocztionCoordainte2D
    public var clLocation: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    /// Default initializer
    /// - latiude: Decimal degrees in latitude
    /// - longitude: Decimal degrees in longitude
    public init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
    
    
}


extension GeoCoordinate: CustomStringConvertible {
    public var description: String {
        return "(lat: \(latitude), lon: \(longitude))"
    }
}


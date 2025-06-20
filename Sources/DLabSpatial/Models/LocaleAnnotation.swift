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
//  File.swift
//  
//
//  Created by Rodney Dyer on 12/9/21.
//

import MapKit

public class LocaleAnnotation: NSObject, Decodable, MKAnnotation {
    
    public enum LocaleType: Int, Decodable {
        case point
        case circle
    }
    
    public var type: LocaleType = .point
    
    private var latitude: CLLocationDegrees = DefaultLocations.center.latitude
    private var longitude: CLLocationDegrees = DefaultLocations.center.longitude
    
    
    @objc dynamic public var coordinate: CLLocationCoordinate2D {
        get {
            return CLLocationCoordinate2D( latitude: latitude,
                                           longitude: longitude)
        }
        set {
            latitude = newValue.latitude
            longitude = newValue.longitude 
        }
    }
}

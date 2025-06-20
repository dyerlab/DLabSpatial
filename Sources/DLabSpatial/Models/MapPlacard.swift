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
//  MapPlacard.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 5/2/24.
//-
import Foundation
import CoreLocation

/**
 A general plotting item for a map
 */
public struct MapPlacard {
    
    /// The ID of the object
    public let id: UUID
    
    /// A title for the location
    public var title: String
    
    /// A longer subtitle to be displayed under the title
    public var subtitle: String
    
    /// Where to plot this thing
    public var coordinate: CLLocationCoordinate2D
    
    /// Theh icon being used
    public var icon: String
    
    /// THe default Initializer
    public init(title: String, subtitle: String, coordinate: CLLocationCoordinate2D, icon: String = "target") {
        self.id = UUID()
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
        self.icon = icon
    }
}


extension MapPlacard: Identifiable, Hashable, Equatable {
    
    /// Equality tests  for location and ID
    static public func == (lhs: MapPlacard, rhs: MapPlacard) -> Bool {
        
        if lhs.id != rhs.id {
            return lhs.coordinate.latitude == rhs.coordinate.latitude && lhs.coordinate.longitude == rhs.coordinate.longitude
        }
        return true
    }
    
    /// Hashing tests
    public func hash(into hasher: inout Hasher) {
        hasher.combine( id )
    }
    
}


extension MapPlacard {
    
    static public var randomSites: [MapPlacard] {
        return [
            MapPlacard(title: "RVA", subtitle: "Richmond Virginia", coordinate: CLLocationCoordinate2D(latitude: 37.5407, longitude: -77.4360 ) ),
            MapPlacard(title: "COTU", subtitle: "Ashland Virginia", coordinate: CLLocationCoordinate2D(latitude: 37.7590, longitude: -77.480 ), icon: "mug" ),
            MapPlacard(title: "Hopewell", subtitle: "Hopwell Virginia", coordinate: CLLocationCoordinate2D(latitude: 37.3043, longitude: -77.2872 ) ),
        ]
    }
}

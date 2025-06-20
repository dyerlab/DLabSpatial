//
//  CLLocationCoordinate2D.swift
//  DLabPopGraph
//
//  Created by Rodney Dyer on 5/21/25.
//

import Foundation
import CoreLocation

public func DistanceBetween(_ coordinate1: CLLocationCoordinate2D, _ coordinate2: CLLocationCoordinate2D) -> Double {
    let location1 = CLLocation(latitude: coordinate1.latitude, longitude: coordinate1.longitude)
    let location2 = CLLocation(latitude: coordinate2.latitude, longitude: coordinate2.longitude)
    return location1.distance(from: location2) / 1000.0 // Distance in kilometers
}



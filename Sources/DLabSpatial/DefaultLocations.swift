//
//  File.swift
//  
//
//  Created by Rodney Dyer on 12/9/21.
//

import Foundation
import MapKit 

enum DefaultLocations {
    static let center = CLLocationCoordinate2D(latitude: 37.5407, longitude: -77.4360)
    static let region = MKCoordinateRegion(center: DefaultLocations.center,
                                           latitudinalMeters: 1000, longitudinalMeters: 1000)
}

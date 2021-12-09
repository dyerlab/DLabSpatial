//
//  File.swift
//  
//
//  Created by Rodney Dyer on 12/9/21.
//

import MapKit

class LocaleAnnotation: NSObject, Decodable, MKAnnotation {
    
    enum LocaleType: Int, Decodable {
        case point
        case circle
    }
    
    var type: LocaleType = .point
    
    private var latitude: CLLocationDegrees = DefaultLocations.center.latitude
    private var longitude: CLLocationDegrees = DefaultLocations.center.longitude
    
    
    @objc dynamic var coordinate: CLLocationCoordinate2D {
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

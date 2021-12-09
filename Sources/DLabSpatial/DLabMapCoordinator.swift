//
//  File.swift
//  
//
//  Created by Rodney Dyer on 12/9/21.
//

import Foundation
import MapKit




class DLabMapCoordinator: NSObject, ObservableObject {
    
    @Published var center: CLLocationCoordinate2D = DefaultLocations.center
    @Published var region: MKCoordinateRegion = DefaultLocations.region
    
    var locationManagger = CLLocationManager()
    
}



// MARK: - Location Manager Delegates

extension DLabMapCoordinator: CLLocationManagerDelegate {
 

    /**
     This function captures notifications when the location manager's authorizations are changed.  by
        default, we will set up user tracking if allowed when this changes.
     */
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
            
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        case .restricted:
            print("Your location has been restricted, most likely due to parental controls.")
        case .denied:
            print("Your location has been restricted, most likely due to parental controls.")
        case .authorizedAlways:
            print("yes!")
        @unknown default:
            print("Unknown status for location authorization.")
        }
        
    }

}

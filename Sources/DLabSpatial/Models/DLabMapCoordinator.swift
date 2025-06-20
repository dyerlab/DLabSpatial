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

import Foundation
import MapKit




public class DLabMapCoordinator: NSObject, ObservableObject {
    
    @Published public var center: CLLocationCoordinate2D = DefaultLocations.center
    @Published public var region: MKCoordinateRegion = DefaultLocations.region
    
    public var locationManagger = CLLocationManager()
    
}



// MARK: - Location Manager Delegates

extension DLabMapCoordinator: CLLocationManagerDelegate {
 

    /**
     This function captures notifications when the location manager's authorizations are changed.  by
        default, we will set up user tracking if allowed when this changes.
     */
    public  func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
            
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        case .restricted:
            print("Your location has been restricted, most likely due to parental controls.")
        case .denied:
            print("Your location has been restricted, most likely due to parental controls.")
        case .authorizedAlways:
            print("yes!")
        case .authorizedWhenInUse:
            print("You have authorized for 'when in use'.")
        @unknown default:
            print("Unknown status for location authorization.")
        }
        
    }

}

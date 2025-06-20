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
//  Mappable Node.swift
//  DLabPopGraph
//
//  Created by Rodney Dyer on 5/21/25.
//

import Foundation
import CoreLocation


public protocol MappableNode {
    var mapCoordinate: CLLocationCoordinate2D? { get }
}


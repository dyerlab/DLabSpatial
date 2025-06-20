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
//  LocalePointAnnotationView.swift
//
//
//  Created by Rodney Dyer on 12/9/21.
//

import MapKit


class LocalePointAnnotationView: MKMarkerAnnotationView {
    
    static let ReuseID = "localeAnnotation"
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        clusteringIdentifier = "point"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForDisplay() {
        super.prepareForDisplay()
        displayPriority = .defaultLow
        let sfSymbolName: String = "smallcircle.circle"
        
        #if os(iOS)
        glyphImage = UIImage(systemName: sfSymbolName)
        #elseif os(OSX)
        glyphImage = NSImage(systemSymbolName: sfSymbolName,
                             accessibilityDescription: "point location image")
        #endif
    }
    
}

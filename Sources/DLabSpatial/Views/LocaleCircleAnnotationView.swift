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

class LocaleCircleAnnotationView: MKAnnotationView {
    
    var radius: Double = 10.0
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        clusteringIdentifier = "circle"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Not implemented yet")
    }
    
    override func prepareForDisplay() {
        super.prepareForDisplay()
        image = drawCircleImage()
        displayPriority = .defaultHigh
        
    }
    
    #if os(iOS)
    private func drawCircleImage() -> UIImage {
        let renderer = UIGraphicsRenderer(size: CGSize(width: 40, height: 40)).fill()
        return renderer.image { _ in
            UIColor.systemPink.setFill()
            UIBezierPath(ovalIn: CGRect(x: 0,
                                        y: 0,
                                        width: self.radius/2.0,
                                        height: self.radius/2.0)).fill()
            UIColor.systemGray.setStroke()
            UIBezierPath(ovalIn: CGRect(x: 0,
                                        y: 0,
                                        width: self.radius/2.0,
                                        height: self.radius/2.0)).stroke()
        }
    }
    
    #elseif os(OSX)
    private func drawCircleImage() -> NSImage {
        let imge = NSImage(size: CGSize(width: self.radius/2.0,
                                        height: self.radius/2.0))
        imge.lockFocus()
        
        NSColor.systemPink.setFill()
        NSBezierPath(ovalIn: CGRect(x: 0,
                                    y: 0,
                                    width: self.radius/2.0,
                                    height: self.radius/2.0)).fill()
        NSColor.systemGray.setStroke()
        NSBezierPath(ovalIn: CGRect(x: 0,
                                    y: 0,
                                    width: self.radius/2.0,
                                    height: self.radius/2.0)).stroke()
        
        
        imge.unlockFocus()
        return imge
    }
    #endif
    
}

//
//  File.swift
//  
//
//  Created by Rodney Dyer on 12/9/21.
//

import MapKit


class LocaleClusterAnnotationView: MKAnnotationView {
    
    var size: Double = 50.0
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        collisionMode = .circle
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Not implemented yet")
    }
    
    override func prepareForDisplay() {
        super.prepareForDisplay()
        
        // combining cluster annotations
        if let cluster = annotation as? MKClusterAnnotation {
            let total = cluster.memberAnnotations.count
            image = drawClusterImage(total)
        }
    }
    
    
    #if os(iOS)
    private func drawClusterImage(_ total: Int) -> UIImage {
        let renderer = UIGraphicsRenderer(size: CGSize(width: 40, height: 40)).fill()
        return renderer.image { _ in
            UIColor.systemPink.setFill()
            UIBezierPath(ovalIn: CGRect(x: 0,
                                        y: 0,
                                        width: self.size,
                                        height: self.size)).fill()
            
            UIColor.systemGray.setStroke()
            UIBezierPath(ovalIn: CGRect(x: 0,
                                        y: 0,
                                        width: self.size,
                                        height: self.size)).stroke()
            
            let attributes = [ NSAttributedString.Key.foregroundColor: UIColor.black,
                               NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)]
            let text = "\(total)"
            let size = text.size(withAttributes: attributes)
            let rect = CGRect(x: 20 - size.width / 2,
                              y: 20 - size.height / 2,
                              width: size.width,
                              height: size.height)
            text.draw(in: rect, withAttributes: attributes)
        }
        
    }
    #elseif os(OSX)
    private func drawClusterImage(_ total: Int ) -> NSImage {
        let imge = NSImage(size: CGSize(width: self.size,
                                        height: self.size))
        imge.lockFocus()
        
        NSColor.systemPink.setFill()
        NSBezierPath(ovalIn: CGRect(x: 0,
                                    y: 0,
                                    width: self.size ,
                                    height: self.size)).fill()
        NSColor.systemGray.setStroke()
        NSBezierPath(ovalIn: CGRect(x: 0,
                                    y: 0,
                                    width: self.size,
                                    height: self.size)).stroke()
        let attributes = [ NSAttributedString.Key.foregroundColor: NSColor.black,
                           NSAttributedString.Key.font: NSFont.boldSystemFont(ofSize: 20)]
        let text = "\(total)"
        let size = text.size(withAttributes: attributes)
        let rect = CGRect(x: 20 - size.width / 2,
                          y: 20 - size.height / 2,
                          width: size.width,
                          height: size.height)
        text.draw(in: rect, withAttributes: attributes)
        
        imge.unlockFocus()
        return imge
        
    }
    #endif
    
}

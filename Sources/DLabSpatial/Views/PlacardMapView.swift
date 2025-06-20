//
//  PlacardMapView.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 4/30/24.
//

import MapKit
import SwiftUI
import SwiftData

public struct PlacardMapView: View {
    public var plackards: [MapPlacard]
    
    public var body: some View {
        VStack{
            Map {
                ForEach( plackards, id: \.self) { item in
                    
                    Annotation( item.title,
                                coordinate: item.coordinate,
                                anchor: .center,
                                content: {
                        ZStack {
                            Circle()
                                .fill( .secondary )
                            Image(systemName: item.icon)
                                .foregroundColor( .red )
                                .bold()
                        }
                    }
                    )
                    
                }
            }
            .mapControlVisibility( .automatic )
            .mapStyle( .hybrid )
        }
       

    }
}

#Preview {
    PlacardMapView( plackards: MapPlacard.randomSites ) 
}



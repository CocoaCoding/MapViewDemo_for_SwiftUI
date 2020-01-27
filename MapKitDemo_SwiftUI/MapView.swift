//
//  ContentView.swift
//  MapKitDemo_SwiftUI
//
//  Created by Holger Hinzberg on 15.12.19.
//  Copyright © 2019 Holger Hinzberg. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView : UIViewRepresentable
{
    let landmarkData = LandmarkAnnotationsRepository.DemoData()
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
    
        // Center the map around the first Landmark
        guard let first = landmarkData.first else { return }
        let span = MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
        let region = MKCoordinateRegion(center: first.coordinate, span: span)
        uiView.setRegion(region, animated: true)
        
        uiView.delegate = context.coordinator

        self.setAnnotations(from: uiView, landmarks:  landmarkData)
    }
   

    func makeCoordinator() -> MapViewCoordinator{
         MapViewCoordinator(self)
    }

    func makeUIView(context: Context) -> MKMapView{
        MKMapView(frame: .zero)
    }
    
    private func setAnnotations(from mapView: MKMapView, landmarks : [LandmarkAnnotation])
    {
      mapView.removeAnnotations(mapView.annotations)
      mapView.addAnnotations(landmarks)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

//
//  MapViewCoordinator.swift
//  MapKitDemo_SwiftUI
//
//  Created by Holger Hinzberg on 15.12.19.
//  Copyright © 2019 Holger Hinzberg. All rights reserved.

import Foundation
import MapKit
import UIKit

// The coordinator class enables us to set a custom symbol for the map annotations

class MapViewCoordinator: NSObject, MKMapViewDelegate {
    
    // Here we need a reference to the View showing the map
    // In this case it is MapView
    var mapViewController: MapView
    
    init(_ control: MapView) {
        self.mapViewController = control
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?{
        //Create a custom view for the annotation
        let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "customAnnotation")
        annotationView.image = UIImage(systemName: "mappin.circle")

        // Do we want a callout?
        annotationView.canShowCallout = true
        
        // Calculate the prefcet width for the label
        let labelTitle = " \(annotation.title!!) "
        let labelTitleWidth = labelTitle.width(withConstrainedHeight: 10, font: UIFont.systemFont(ofSize: 12.0))

        // Add a lable for the totle to the annotation because custom annotation
        //  do come without a lable by default
        let annotationLabel = UILabel(frame: CGRect(x: -25, y: 25, width: labelTitleWidth, height: 20))
        annotationLabel.numberOfLines = 1
        annotationLabel.textAlignment = .center
        annotationLabel.font = UIFont.systemFont(ofSize: 12.0)
        annotationLabel.text = annotation.title!!
        annotationLabel.backgroundColor = UIColor.white
        annotationLabel.layer.cornerRadius = 5
        annotationLabel.clipsToBounds = true
        // A colored border for the lable
        annotationLabel.layer.borderColor = CGColor(srgbRed: 0, green: 0, blue: 1, alpha: 0.3)
        annotationLabel.layer.borderWidth = 1
        
        annotationView.addSubview(annotationLabel)
        
        return annotationView
    }
    
    // When the user selects an annotation the view is centered at that loaction
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let coordinates = view.annotation?.coordinate else { return }
        let span = mapView.region.span
        let region = MKCoordinateRegion(center: coordinates, span: span)
        mapView.setRegion(region, animated: true)
    }
}

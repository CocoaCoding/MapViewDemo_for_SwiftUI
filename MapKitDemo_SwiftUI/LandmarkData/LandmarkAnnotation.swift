//
//  LandmarkAnnotation.swift
//  MapKitDemo_SwiftUI
//
//  Created by Holger Hinzberg on 15.12.19.
//  Copyright © 2019 Holger Hinzberg. All rights reserved.
//

import Foundation
import MapKit

class LandmarkAnnotation: NSObject, MKAnnotation, Codable
{
    let id : String?
    let title: String?
    let subtitle: String?
    let coordinate: CLLocationCoordinate2D

    init(id: String?, title: String?, subtitle: String?,coordinate: CLLocationCoordinate2D) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
    
    enum CodingKeys: CodingKey {
        case id, title, subtitle, latitude, longitude
    }
  
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        subtitle = try container.decode(String.self, forKey: .subtitle)
        let latitude : Double = try container.decode(Double.self, forKey: .latitude)
        let longitude : Double = try container.decode(Double.self, forKey: .longitude)
        self.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(title, forKey: .title)
        try container.encode(subtitle, forKey: .subtitle)
        try container.encode(coordinate.latitude, forKey: .latitude)
        try container.encode(coordinate.longitude, forKey: .longitude)
    }
}

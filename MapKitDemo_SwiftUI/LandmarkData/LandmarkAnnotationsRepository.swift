//
//  LandmarkAnnotationsRepository.swift
//  MapKitDemo_SwiftUI
//
//  Created by Holger Hinzberg on 15.12.19.
//  Copyright © 2019 Holger Hinzberg. All rights reserved.
//

import Foundation

class LandmarkAnnotationsRepository {
    
    static func DemoData () -> [LandmarkAnnotation]
    {
        let landmarks = Bundle.main.decode([LandmarkAnnotation].self, from: "landmarks.json")
        return landmarks
    }
}

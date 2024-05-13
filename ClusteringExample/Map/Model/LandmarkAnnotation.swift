//
//  LandmarkAnnotation.swift
//  ClusteringExample
//
//  Created by Irani, Jal J. on 5/8/24.
//

import Foundation
import MapKit

class LandmarkAnnotation: NSObject, MKAnnotation {
    let coordinate: CLLocationCoordinate2D
    let count: Int
    let name: String
    
    init(coordinate: CLLocationCoordinate2D, count: Int, name: String) {
        self.coordinate = coordinate
        self.count = count
        self.name = name
        super.init()
    }
}

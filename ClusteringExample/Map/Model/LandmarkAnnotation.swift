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
    
    init(coordinate: CLLocationCoordinate2D, count: Int) {
        self.coordinate = coordinate
        self.count = count
        super.init()
    }
}

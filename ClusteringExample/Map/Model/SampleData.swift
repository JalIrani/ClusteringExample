//
//  SampleData.swift
//  ClusteringExample
//
//  Created by Irani, Jal J. on 5/8/24.
//

import Foundation
import MapKit

struct SampleData: Identifiable {
    var id = UUID()
    var latitude: Double
    var longitude: Double
    var count: Int
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

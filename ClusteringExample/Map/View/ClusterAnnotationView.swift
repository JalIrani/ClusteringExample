//
//  ClusterAnnotationView.swift
//  ClusteringExample
//
//  Created by Irani, Jal J. on 5/8/24.
//

import Foundation
import MapKit

class CustomClusterAnnotationView: MKMarkerAnnotationView {
    static let reuseId = "clusterAnnotation"
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        clusteringIdentifier = AnnotationView.clusterId
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForDisplay() {
        super.prepareForDisplay()
        
        markerTintColor = .blue
        glyphText = "●"
        glyphTintColor = .white
    }
}

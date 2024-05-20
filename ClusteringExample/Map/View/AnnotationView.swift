//
//  AnnotationView.swift
//  ClusteringExample
//
//  Created by Irani, Jal J. on 5/8/24.
//

import Foundation
import MapKit

class AnnotationView: MKMarkerAnnotationView {
    
    static let reuseId = "cultureAnnotation"
    static let clusterId = "clustering"
    
    var titleLabel: UILabel?
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        clusteringIdentifier = AnnotationView.clusterId
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForDisplay() {
        super.prepareForDisplay()
                
        markerTintColor = .black
        canShowCallout = false
        
        if let annotation = self.annotation as? LandmarkAnnotation {
            if annotation.count > 50 {
                markerTintColor = .red
                glyphTintColor = .white
            } else {
                markerTintColor = .black
                glyphTintColor = .white
            }
            glyphText = "\(annotation.count)"
            
            titleLabel = UILabel()
            if let titleLabel = titleLabel {
                titleLabel.text = annotation.name
                titleLabel.font = UIFont.boldSystemFont(ofSize: 14)
                titleLabel.textColor = .black
                titleLabel.textAlignment = .center
                titleLabel.numberOfLines = 0
                titleLabel.sizeToFit()
                
                addSubview(titleLabel)
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if let titleLabel = titleLabel {
            titleLabel.frame.origin = CGPoint(x: -titleLabel.frame.width / 2 + bounds.width / 2, y: bounds.height)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

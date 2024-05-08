//
//  MapView.swift
//  ClusteringExample
//
//  Created by Irani, Jal J. on 5/3/24.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    var forDisplay = data
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 43.64422936785126, longitude: 142.39329541313924),
                                                    span: MKCoordinateSpan(latitudeDelta: 1.5, longitudeDelta: 2))
    @Binding var selectedAnnotation: LandmarkAnnotation?
    @Binding var displaysheet: Bool

    class Coordinator: NSObject, MKMapViewDelegate {
        
        var parent: MapView
        
        init(_ parent: MapView) {
            self.parent = parent
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            if let cluster = annotation as? MKClusterAnnotation {
                return CustomClusterAnnotationView(annotation: cluster, reuseIdentifier: CustomClusterAnnotationView.reuseId)
            } else if let landmark = annotation as? LandmarkAnnotation {
                return AnnotationView(annotation: landmark, reuseIdentifier: AnnotationView.reuseId)
            }
            return nil
        }
        
        func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
            if let annotation = view.annotation as? LandmarkAnnotation {
                self.parent.selectedAnnotation = annotation
                self.parent.displaysheet = true
                print(annotation.count)
            }
        }
    }
    
    func makeCoordinator() -> Coordinator {
        MapView.Coordinator(self)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let view = MKMapView()
        view.delegate = context.coordinator
        view.setRegion(region, animated: false)
        view.mapType = .standard
        
        for points in forDisplay {
            let annotation = LandmarkAnnotation(coordinate: points.coordinate, count: points.count)
            view.addAnnotation(annotation)
        }
        return view
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) { }
}

var data = [
    SampleData(latitude: 43.70564024126748, longitude: 142.37968945214223, count: 40),
    SampleData(latitude: 43.73564025126748, longitude: 142.37968955214223, count: 20),
    SampleData(latitude: 43.72564026126748, longitude: 142.37968946214223, count: 10),
    SampleData(latitude: 43.81257464206404, longitude: 142.82112322464369, count: 60),
    SampleData(latitude: 43.38416585162576, longitude: 141.7252598737476, count: 80),
    SampleData(latitude: 45.29168643283501, longitude: 141.95286751470724, count: 100),
    SampleData(latitude: 45.49261392585982, longitude: 141.9343973160499, count: 120),
    SampleData(latitude: 44.69825427301145, longitude: 141.91227845284203, count: 150)
]

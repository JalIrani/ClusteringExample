//
//  ContentView.swift
//  ClusteringExample
//
//  Created by Irani, Jal J. on 5/3/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @State var displaysheet: Bool = false
    @State var selectedAnnotation: LandmarkAnnotation?

    var body: some View {
        MapView(selectedAnnotation: $selectedAnnotation, displaysheet: $displaysheet)
            .edgesIgnoringSafeArea(.all)
            .sheet(isPresented: Binding(
                get: { displaysheet },
                set: { displaysheet = $0 }
            )) {
                if let selectedAnnotation = selectedAnnotation {
                    CountSheetView(count: selectedAnnotation.count)
                }
            }
    }
}

#Preview {
    ContentView()
}

struct CountSheetView: View {
    var count: Int
    
    var body: some View {
        Text("Count")
        Text("Count: \(count)")
            .font(.headline)
            .padding()
    }
}

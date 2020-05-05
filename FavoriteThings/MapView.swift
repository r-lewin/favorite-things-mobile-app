//
//  MapView.swift
//  FavoriteThings
//
//  Created by Ryan Lewin on 5/5/20.
//  Copyright © 2020 Ryan Lewin. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    @ObservedObject var item: Item
    @ObservedObject var location: Location
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: .zero)
        mapView.delegate = location
        location.updated()
        return mapView
    }
  
    func updateUIView(_ mapView: MKMapView, context: Context) {
        guard !location.isUpdated else { return }
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: location.lat, longitude: location.lon), latitudinalMeters: 10_000, longitudinalMeters: 10_000)
        mapView.setRegion(region, animated: true)
    }
    
}

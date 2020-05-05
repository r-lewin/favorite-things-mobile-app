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
    @ObservedObject var location = Location()
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: .zero)
        return mapView
    }
    
    func updateUIView(_ mapView: MKMapView, context: Context) {
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: item.lat, longitude: item.lon), latitudinalMeters: 10_000, longitudinalMeters: 10_000)
        mapView.setRegion(region, animated: true)
    }
    
}

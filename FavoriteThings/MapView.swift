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
    @ObservedObject var local: Location
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: .zero)
        mapView.delegate = local
        local.updated()
        return mapView
    }
    
//    func updateUIView(_ mapView: MKMapView, context: Context) {
//        guard !item.local.isUpdated else { return }
//        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: item.local.lat, longitude: item.local.lon), latitudinalMeters: 10_000, longitudinalMeters: 10_000)
//        mapView.setRegion(region, animated: true)
//    }
//
    func updateUIView(_ mapView: MKMapView, context: Context) {
        guard !local.isUpdated else { return }
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: local.lat, longitude: local.lon), latitudinalMeters: 10_000, longitudinalMeters: 10_000)
        mapView.setRegion(region, animated: true)
    }
    
}

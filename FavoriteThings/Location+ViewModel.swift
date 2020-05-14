//
//  Location+ViewModel.swift
//  FavoriteThings
//
//  Created by Ryan Lewin on 5/5/20.
//  Copyright © 2020 Ryan Lewin. All rights reserved.
//

import Foundation
import CoreData
import SwiftUI
import CoreLocation
import MapKit

extension Location: MKMapViewDelegate {
    
    //Name string for location attached to item
    var nameString: String {
        get { name ?? "" }
        set { name = newValue }
    }
    //Latitude attached to item as string
    var latitudeString: String {
        get { String(lat)}
        set {
            guard let coord = CLLocationDegrees(newValue) else { return }
            lat = coord
        }
    }
    //Longitude attached to item as string
    var longitudeString: String {
        get { String(lon)}
        set {
            guard let coord = CLLocationDegrees(newValue) else { return }
            lon = coord
        }
    }
    //Updated property attached to string
    public override var isUpdated: Bool {
        get { updating }
        set { updating = newValue }
    }
    
    func updated() {
        isUpdated = false
    }
    //Changes updated property of location to false
    public func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
        isUpdated = true
        let centre = mapView.centerCoordinate
        self.latitudeString = String(centre.latitude)
        self.longitudeString = String(centre.longitude)
    }
    //Uses name to update coords of item location
    func updateCoordsFromName() {
        isUpdated = false
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(self.name!) { (maybePlaceMarks, maybeError) in
            guard let placemark = maybePlaceMarks?.first,
                let location = placemark.location else {
                    let description: String
                    if let error = maybeError {
                        description = "\(error)"
                    } else {
                        description = "Error Unknown"
                    }
                    print("Error: \(description)")
                    return
            }
            self.latitudeString = String(location.coordinate.latitude)
            self.longitudeString = String(location.coordinate.longitude)
        }
    }
    //Use coords to update the location name attached to item
    func updateNameFromCoords() {
        isUpdated = false
        let geocoder = CLGeocoder()
        let location = CLLocation(latitude: self.lat, longitude: self.lon)
        geocoder.reverseGeocodeLocation(location) { (maybePlaceMarks, maybeError) in
            guard let placemark = maybePlaceMarks?.first else {
                let description: String
                if let error = maybeError {
                    description = "\(error)"
                } else {
                    description = "Error Unknown"
                }
                print("Error: \(description)")
                return
            }
            self.nameString = (placemark.name) ?? placemark.locality ?? placemark.country ?? "Unknown"
        }
    }
}


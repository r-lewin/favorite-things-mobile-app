//
//  Location.swift
//  FavoriteThings
//
//  Created by Ryan Lewin on 5/5/20.
//  Copyright © 2020 Ryan Lewin. All rights reserved.
//

import Foundation
import CoreLocation

class Location: Identifiable, ObservableObject {
    
    @Published var coordinates = CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0)
    
    var name = ""
    
    var latitude: String {
        get { "\(coordinates.latitude)" }
        set { guard let coord = CLLocationDegrees(newValue) else { return }
            coordinates.latitude = coord
        }
    }
    
    var longitude: String {
        get { "\(coordinates.longitude)" }
        set { guard let coord = CLLocationDegrees(newValue) else { return }
            coordinates.longitude = coord
        }
    }
    
    func updateCoordsFromName() {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(self.name) { (maybePlaceMarks, maybeError) in
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
            self.coordinates = location.coordinate
        }
    }
    
    func updateNameFromCoords() {
        let geocoder = CLGeocoder()
        let location = CLLocation(latitude: coordinates.latitude, longitude: coordinates.longitude)
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
            self.name = placemark.name ?? placemark.locality ?? placemark.country ?? "Unknown"
        }
    }
}

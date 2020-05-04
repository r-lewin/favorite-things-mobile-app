//
//  Item+ViewModel.swift
//  FavoriteThings
//
//  Created by Ryan Lewin on 25/4/20.
//  Copyright © 2020 Ryan Lewin. All rights reserved.
//

import Foundation
import CoreData
import SwiftUI
import CoreLocation

extension Item {
    
    var coordinates: CLLocationCoordinate2D {
        get { CLLocationCoordinate2D(latitude: -27.962, longitude: 153.382) }
        set { newValue }
    }
    
    var latitude: String {
        get { "\(lat)" }
        set { lat = CLLocationDegrees(newValue) ?? coordinates.latitude}
    }
    
    var longitude: String {
        get { "\(lon)" }
        set {lon = CLLocationDegrees(newValue) ?? coordinates.longitude }
    }
    
    var placeString: String {
        get { place ?? "" }
        set { place = newValue }
    }
    
    // Creates computed property for name
    var nameString: String {
        get { name ?? "" }
        set { name = newValue}
    }
    // Creates computed property for note
    var noteString: String {
        get { note ?? ""}
        set { note = newValue}
    }
    // Creates computed property for URL
    var urlString: String {
        get { image_url ?? "" }
        set { image_url = newValue }
    }
    // Creates computed property for tag1
    var tag1String: String {
        get { tag1 ?? "" }
        set { tag1 = newValue}
    }
    // Creates computed property for info1
    var info1String: String {
        get { info1 ?? "" }
        set { info1 = newValue}
    }
    // Creates computed property for tag2
    var tag2String: String {
        get { tag2 ?? "" }
        set { tag2 = newValue}
    }
    // Creates computed property for info2
    var info2String: String {
        get { info2 ?? "" }
        set { info2 = newValue}
    }
    // Creates computed property for tag3
    var tag3String: String {
        get { tag3 ?? "" }
        set { tag3 = newValue}
    }
    // Creates computed property for info3
    var info3String: String {
        get { info3 ?? "" }
        set { info3 = newValue}
    }
    
    // Runs process of checking for image and downloading if not existing - returns image when called
    func getImg() -> Image{
        // Returns a placeholder image if img can't be found
        guard let imgURL = URL(string: self.image_url!),
        let imgData = try? Data(contentsOf: imgURL),
        let uiImg = UIImage(data: imgData) else {
            return Image("placeholder")
        }
        // Returns downloaded img if valid and found using the picURL - Adds to image cache
        let  downloadedImg = Image(uiImage: uiImg)
        return downloadedImg
        
    }
    
    func updateCoordsFromName() {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(self.place!) { (maybePlaceMarks, maybeError) in
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
            self.lat = location.coordinate.latitude
            self.lon = location.coordinate.longitude
        }
    }
    
    func updateNameFromCoords() {
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
            self.placeString = placemark.name ?? placemark.locality ?? placemark.country ?? "Unknown"
        }
    }
}

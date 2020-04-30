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

extension Item {
    
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
}

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
    
//    var entries: [Item_info] {
//        (self.contains?.array as? [Item_info]) ?? []
//    }
    
    var nameString: String {
        get { name ?? "" }
        set { name = newValue}
    }
    
    var noteString: String {
        get { note ?? ""}
        set { note = newValue}
    }
    
    var urlString: String {
        get { image_url ?? "" }
        set { image_url = newValue }
    }
    
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

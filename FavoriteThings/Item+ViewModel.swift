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
    
    var tag1String: String {
        get { tag1 ?? "" }
        set { tag1 = newValue}
    }
    
    var info1String: String {
        get { info1 ?? "" }
        set { info1 = newValue}
    }
    
    var tag2String: String {
        get { tag2 ?? "" }
        set { tag2 = newValue}
    }
    
    var info2String: String {
        get { info2 ?? "" }
        set { info2 = newValue}
    }
    
    var tag3String: String {
        get { tag3 ?? "" }
        set { tag3 = newValue}
    }
    
    var info3String: String {
        get { info3 ?? "" }
        set { info3 = newValue}
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

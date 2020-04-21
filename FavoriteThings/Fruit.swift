//
//  Fruit.swift
//  FavoriteThings
//
//  Created by Ryan Lewin on 18/4/20.
//  Copyright © 2020 Ryan Lewin. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

// Defines one fruit - Fruit is an observable object to accomodate real-time changes in the view
class Fruit: ObservableObject, Identifiable, Codable {
    var id = UUID()
    @Published var name: String // Common name associated with the fruit
    @Published var family: String // Family associated with the fruit
    @Published var genus: String // Genus associated with the fruit
    @Published var taste: String
    @Published var note: String = "" // Notes to be stored - Written in view
    @Published var picURL: String = "" // Contains URL locatrion of image
    var imageCache = Dictionary<String, Image>() // Caches images as they are change - Avoids redownloading
    var pic = Image("placeholder") // Images displayed in view
    
    // Adds keys to be used when encoding and decoding fruit data
    private enum CodingKeys: String, CodingKey {
        case name
        case family
        case genus
        case taste
        case note
        case picURL
    }
    
    // Inits empty values - Needed seperate from required init as values are initilaised and published
    init() {
        name = ""
        family = ""
        genus = ""
        taste = ""
        picURL = ""
        pic = imageCache[picURL] ?? Image("placeholder")
    }
    
    // Decodes fruit data from JSON data found in the txt file init in scene delegate
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        family = try container.decode(String.self, forKey: .family)
        genus = try container.decode(String.self, forKey: .genus)
        taste = try container.decode(String.self, forKey: .taste)
        note = try container.decode(String.self, forKey: .note)
        picURL = try container.decode(String.self, forKey: .picURL)
    }

    // Encodes and the fruit data so that it can be saved in the txt file
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(family, forKey: .family)
        try container.encode(genus, forKey: .genus)
        try container.encode(genus, forKey: .taste)
        try container.encode(note, forKey: .note)
        try container.encode(picURL, forKey: .picURL)
    }
}

// Extends fruit so as to include image cache - helps avoid redownloading of images
extension Fruit {
    // Returns image if already existing in the image cache
    func getImg(url: String) -> Image{
        if self.pic == imageCache[url] {
            return self.pic
        }
        // Returns a placeholder image if img can't be found
        guard let imgURL = URL(string: self.picURL),
        let imgData = try? Data(contentsOf: imgURL),
        let uiImg = UIImage(data: imgData) else {
            return Image("placeholder")
        }
        // Returns downloaded img if valid and found using the picURL - Adds to image cache 
        let  downloadedImg = Image(uiImage: uiImg)
        imageCache[url] = downloadedImg
        print(self.imageCache.count)
        return downloadedImg
        
    }
}

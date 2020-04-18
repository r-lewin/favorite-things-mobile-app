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
    @Published var note: String = "" // Notes to be stored - Written in view
    @Published var picURL: String = "" // Contains URL locatrion of image
    var imageCache = Dictionary<String, Image>() // Caches images as they are change - Avoids redownloading
    var pic = Image("placeholder") // Images displayed in view
    
    private enum CodingKeys: String, CodingKey {
        case name
        case family
        case genus
        case note
        case picURL
    }
    
    init() {
        name = ""
        family = ""
        genus = ""
        picURL = ""
        pic = imageCache[picURL] ?? Image("placeholder")
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        family = try container.decode(String.self, forKey: .family)
        genus = try container.decode(String.self, forKey: .genus)
        note = try container.decode(String.self, forKey: .note)
        picURL = try container.decode(String.self, forKey: .picURL)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(family, forKey: .family)
        try container.encode(genus, forKey: .genus)
        try container.encode(note, forKey: .note)
        try container.encode(picURL, forKey: .picURL)
    }
}

extension Fruit {
    func getImg(url: String) -> Image{
        if self.pic == imageCache[url] {
            return self.pic
        }
        
        guard let imgURL = URL(string: self.picURL),
        let imgData = try? Data(contentsOf: imgURL),
        let uiImg = UIImage(data: imgData) else {
            return Image("placeholder")
        }
        
        let  downloadedImg = Image(uiImage: uiImg)
        imageCache[url] = downloadedImg
        print(self.imageCache.count)
        return downloadedImg
        
    }
}

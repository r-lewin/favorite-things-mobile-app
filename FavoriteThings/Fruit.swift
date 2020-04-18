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
class Fruit: ObservableObject, Identifiable {
    var id = UUID()
    @Published var name: String // Common name associated with the fruit
    @Published var family: String // Family associated with the fruit
    @Published var genus: String // Genus associated with the fruit
    @Published var note: String = "" // Notes to be stored - Written in view
    @Published var picURL: String = "" // Contains URL locatrion of image
    var imageCache = Dictionary<String, Image>() // Caches images as they are change - Avoids redownloading
    var pic : Image // Images displayed in view
    
    init(name: String, family: String, genus: String, picURL: String) {
        self.name = name
        self.family = family
        self.genus = genus
        self.picURL = picURL
        self.pic = imageCache[picURL] ?? Image("placeholder")
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

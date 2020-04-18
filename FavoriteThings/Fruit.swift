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

class Fruit: ObservableObject, Identifiable {
    var id = UUID()
    @Published var name: String
    @Published var family: String
    @Published var genus: String
    @Published var note: String = ""
    @Published var picURL: String = ""
    var imageCache = Dictionary<String, Image>()
    var pic : Image
    
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

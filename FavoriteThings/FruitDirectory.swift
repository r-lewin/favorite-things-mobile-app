//
//  FruitDirectory.swift
//  FavoriteThings
//
//  Created by Ryan Lewin on 18/4/20.
//  Copyright © 2020 Ryan Lewin. All rights reserved.
//

import Foundation

class FruitDirectory: ObservableObject, Identifiable {
    @Published var fruits: [Fruit] = []
    
    init(fuirts: [Fruit]) {
        self.fruits = []
    }
    
    func addFruit(name: String = "", family: String = "", genus: String = "", picURL: String = "") {
        let fruit = Fruit(name: name, family: family, genus: genus, picURL: picURL)
        fruits.append(fruit)
    }
}

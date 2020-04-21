//
//  FruitDirectory.swift
//  FavoriteThings
//
//  Created by Ryan Lewin on 18/4/20.
//  Copyright © 2020 Ryan Lewin. All rights reserved.
//

import Foundation

// Defines FruitDirectory including fruits array containing Fruit type
class FruitDirectory: ObservableObject, Identifiable, Codable {
    @Published var fruits: [Fruit]
    
    // Adds key to be used when encoding and decoding fruitDirectory data
    private enum CodingKeys: String, CodingKey {
        case fruits
    }
    
    // Inits empty values - Needed seperate from required init as value is initilaised and published
    init() {
        fruits = [Fruit]()
    }
    
    // Decodes fruitDirectory data from JSON data found in the txt file init in scene delegate
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        fruits = try container.decode([Fruit].self, forKey: .fruits)
    }
    
    // Encodes and the fruitDirectory data so that it can be saved in the txt file
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(fruits, forKey: .fruits)
    }
}

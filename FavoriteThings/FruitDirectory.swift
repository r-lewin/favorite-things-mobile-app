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
    
    private enum CodingKeys: String, CodingKey {
        case fruits
    }
    
    init() {
        fruits = [Fruit]()
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        fruits = try container.decode([Fruit].self, forKey: .fruits)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(fruits, forKey: .fruits)
    }
}

//
//  Item+ViewModel.swift
//  FavoriteThings
//
//  Created by Ryan Lewin on 25/4/20.
//  Copyright © 2020 Ryan Lewin. All rights reserved.
//

import Foundation
import CoreData

extension Item {
    
    var entries: [Item_info] {
        (self.contains?.array as? [Item_info]) ?? []
    }
}

//
//  Item_list+ViewModel.swift
//  FavoriteThings
//
//  Created by Ryan Lewin on 25/4/20.
//  Copyright © 2020 Ryan Lewin. All rights reserved.
//

import Foundation
import CoreData

extension Item_list {
    
    //Creates array of Items as stored in DB. Allows us to muatate the list
    var entries: [Item] {
        get { (stores?.array as? [Item]) ?? [] }
        set { stores = NSOrderedSet(array: newValue) }
    }
    
//    func move(moving: Item, to: Int) {
//        let index = entries.firstIndex(of: moving)!
//        var dest = to
//        if to > index {dest -= 1}
//        self.removeFromStores(at: index)
//        self.insertIntoStores(moving, at: dest)
//    }
}

//
//  Item_info+CoreDataProperties.swift
//  FavoriteThings
//
//  Created by Ryan Lewin on 25/4/20.
//  Copyright © 2020 Ryan Lewin. All rights reserved.
//
//

import Foundation
import CoreData


extension Item_info {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item_info> {
        return NSFetchRequest<Item_info>(entityName: "Item_info")
    }

    @NSManaged public var tag: String?
    @NSManaged public var content: String?
    @NSManaged public var stored: Item?

}

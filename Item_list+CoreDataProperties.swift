//
//  Item_list+CoreDataProperties.swift
//  FavoriteThings
//
//  Created by Ryan Lewin on 25/4/20.
//  Copyright © 2020 Ryan Lewin. All rights reserved.
//
//

import Foundation
import CoreData


extension Item_list {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item_list> {
        return NSFetchRequest<Item_list>(entityName: "Item_list")
    }

    @NSManaged public var title: String?
    @NSManaged public var date: Date?
    @NSManaged public var stores: NSOrderedSet?

}

// MARK: Generated accessors for stores
extension Item_list {

    @objc(insertObject:inStoresAtIndex:)
    @NSManaged public func insertIntoStores(_ value: Item, at idx: Int)

    @objc(removeObjectFromStoresAtIndex:)
    @NSManaged public func removeFromStores(at idx: Int)

    @objc(insertStores:atIndexes:)
    @NSManaged public func insertIntoStores(_ values: [Item], at indexes: NSIndexSet)

    @objc(removeStoresAtIndexes:)
    @NSManaged public func removeFromStores(at indexes: NSIndexSet)

    @objc(replaceObjectInStoresAtIndex:withObject:)
    @NSManaged public func replaceStores(at idx: Int, with value: Item)

    @objc(replaceStoresAtIndexes:withStores:)
    @NSManaged public func replaceStores(at indexes: NSIndexSet, with values: [Item])

    @objc(addStoresObject:)
    @NSManaged public func addToStores(_ value: Item)

    @objc(removeStoresObject:)
    @NSManaged public func removeFromStores(_ value: Item)

    @objc(addStores:)
    @NSManaged public func addToStores(_ values: NSOrderedSet)

    @objc(removeStores:)
    @NSManaged public func removeFromStores(_ values: NSOrderedSet)

}

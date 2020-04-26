//
//  Item+CoreDataProperties.swift
//  FavoriteThings
//
//  Created by Ryan Lewin on 25/4/20.
//  Copyright © 2020 Ryan Lewin. All rights reserved.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var name: String?
    @NSManaged public var creation_date: Date?
    @NSManaged public var image_url: String?
    @NSManaged public var note: String?
    @NSManaged public var contains: NSOrderedSet?
    @NSManaged public var stored: Item_list?

}

// MARK: Generated accessors for contains
extension Item {

    @objc(insertObject:inContainsAtIndex:)
    @NSManaged public func insertIntoContains(_ value: Item_info, at idx: Int)

    @objc(removeObjectFromContainsAtIndex:)
    @NSManaged public func removeFromContains(at idx: Int)

    @objc(insertContains:atIndexes:)
    @NSManaged public func insertIntoContains(_ values: [Item_info], at indexes: NSIndexSet)

    @objc(removeContainsAtIndexes:)
    @NSManaged public func removeFromContains(at indexes: NSIndexSet)

    @objc(replaceObjectInContainsAtIndex:withObject:)
    @NSManaged public func replaceContains(at idx: Int, with value: Item_info)

    @objc(replaceContainsAtIndexes:withContains:)
    @NSManaged public func replaceContains(at indexes: NSIndexSet, with values: [Item_info])

    @objc(addContainsObject:)
    @NSManaged public func addToContains(_ value: Item_info)

    @objc(removeContainsObject:)
    @NSManaged public func removeFromContains(_ value: Item_info)

    @objc(addContains:)
    @NSManaged public func addToContains(_ values: NSOrderedSet)

    @objc(removeContains:)
    @NSManaged public func removeFromContains(_ values: NSOrderedSet)

}

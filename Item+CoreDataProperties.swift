//
//  Item+CoreDataProperties.swift
//  DreamLister
//
//  Created by Cody Condon on 2016-09-14.
//  Copyright © 2016 Cody Condon. All rights reserved.
//

import Foundation
import CoreData 

extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item");
    }

    @NSManaged public var created: NSDate?
    @NSManaged public var details: String?
    @NSManaged public var price: Double
    @NSManaged public var title: String?
    @NSManaged public var toImage: Image?
    @NSManaged public var toItemType: ItemType?
    @NSManaged public var toStore: Store?

}

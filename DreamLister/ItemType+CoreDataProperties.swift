//
//  ItemType+CoreDataProperties.swift
//  DreamLister
//
//  Created by Cody Condon on 2016-09-14.
//  Copyright © 2016 Cody Condon. All rights reserved.
//

import Foundation
import CoreData
import 

extension ItemType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemType> {
        return NSFetchRequest<ItemType>(entityName: "ItemType");
    }

    @NSManaged public var type: String?
    @NSManaged public var toItem: Item?

}

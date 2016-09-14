//
//  Item+CoreDataClass.swift
//  DreamLister
//
//  Created by Cody Condon on 2016-09-14.
//  Copyright © 2016 Cody Condon. All rights reserved.
//

import Foundation
import CoreData


public class Item: NSManagedObject {
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        self.created = NSDate()
        
    }
}

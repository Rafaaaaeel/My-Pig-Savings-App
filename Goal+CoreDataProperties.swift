//
//  Goal+CoreDataProperties.swift
//  SSV-app
//
//  Created by Rafael Oliveira on 05/04/24.
//
//

import Foundation
import CoreData


extension Goal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Goal> {
        return NSFetchRequest<Goal>(entityName: "Goal")
    }

    @NSManaged public var goal: NSDecimalNumber?
    @NSManaged public var isOnGoing: Bool
    @NSManaged public var name: String?
    @NSManaged public var value: NSDecimalNumber?
    @NSManaged public var createDate: Date?

}

extension Goal : Identifiable {

}

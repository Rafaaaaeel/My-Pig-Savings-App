//
//  Achieviment+CoreDataProperties.swift
//  SSV-app
//
//  Created by Rafael Oliveira on 02/04/24.
//
//

import Foundation
import CoreData


extension Achieviment {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Achieviment> {
        return NSFetchRequest<Achieviment>(entityName: "Achieviment")
    }

    @NSManaged public var completeds: Int64
    @NSManaged public var saved: NSDecimalNumber?
    @NSManaged public var total: NSDecimalNumber?
    @NSManaged public var goals: NSSet?

}

// MARK: Generated accessors for goals
extension Achieviment {

    @objc(addGoalsObject:)
    @NSManaged public func addToGoals(_ value: Goal)

    @objc(removeGoalsObject:)
    @NSManaged public func removeFromGoals(_ value: Goal)

    @objc(addGoals:)
    @NSManaged public func addToGoals(_ values: NSSet)

    @objc(removeGoals:)
    @NSManaged public func removeFromGoals(_ values: NSSet)

}

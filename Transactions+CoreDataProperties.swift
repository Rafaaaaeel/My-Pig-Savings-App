//
//  Transactions+CoreDataProperties.swift
//  SSV-app
//
//  Created by Rafael Oliveira on 12/04/24.
//
//

import Foundation
import CoreData


extension Transactions {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Transactions> {
        return NSFetchRequest<Transactions>(entityName: "Transactions")
    }

    @NSManaged public var editionDate: Date?
    @NSManaged public var value: NSDecimalNumber?
    @NSManaged public var operationType: Int16
    @NSManaged public var goal: Goal?

}

extension Transactions : Identifiable {

}

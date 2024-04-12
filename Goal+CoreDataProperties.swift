//
//  Goal+CoreDataProperties.swift
//  SSV-app
//
//  Created by Rafael Oliveira on 12/04/24.
//
//

import Foundation
import CoreData


extension Goal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Goal> {
        return NSFetchRequest<Goal>(entityName: "Goal")
    }

    @NSManaged public var createDate: Date?
    @NSManaged public var goal: NSDecimalNumber?
    @NSManaged public var isOnGoing: Bool
    @NSManaged public var name: String?
    @NSManaged public var value: NSDecimalNumber?
    @NSManaged public var transactions: NSSet?

    public var lastTransaction: [Transactions] {
        let transactionsSet = transactions as? Set<Transactions> ?? []
        
        return transactionsSet.sorted(by: { $0.editionDate ?? Date() > $1.editionDate ?? Date() })
    }
    
}

// MARK: Generated accessors for transactions
extension Goal {

    @objc(addTransactionsObject:)
    @NSManaged public func addToTransactions(_ value: Transactions)

    @objc(removeTransactionsObject:)
    @NSManaged public func removeFromTransactions(_ value: Transactions)

    @objc(addTransactions:)
    @NSManaged public func addToTransactions(_ values: NSSet)

    @objc(removeTransactions:)
    @NSManaged public func removeFromTransactions(_ values: NSSet)

}

extension Goal : Identifiable {

}

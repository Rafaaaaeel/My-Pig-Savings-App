//
//  Transactions+CoreDataClass.swift
//  SSV-app
//
//  Created by Rafael Oliveira on 12/04/24.
//
//

import Foundation
import CoreData

@objc(Transactions)
public class Transactions: NSManagedObject {

    var Operation: OperationType {
        get { return OperationType.init(rawValue: Int(operationType)) ?? .increase}
        set { operationType = Int16(newValue.rawValue) }
    }
    
}

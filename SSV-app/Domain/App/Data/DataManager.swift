import Foundation
public protocol DataManagerProtocol {
    
    var errorHandler: (() -> Void)? { get set }
    
//    func createGoal(name: String, total: Decimal)
}

public class DataManager: DataManagerProtocol {
    
    public var errorHandler: (() -> Void)? = nil
    
    public static let shared = DataManager()
    
    private let container: TransactionContainerProtocol
    
    private init<Container: TransactionContainerProtocol>(container: Container = TransactionContainer.shared) {
        self.container = container
    }
    
//    public func createGoal(name: String, total: Decimal) {
//        let goal = Goal(context: container.viewContext)
//        goal.goal = (total) as NSDecimalNumber
//        goal.name = name
//        
//        do {
//            try container.saveContext()
//        } catch {
//            errorHandler?()
//        }
//    }
//    
    
}

import Foundation


internal protocol GoalCreateFetcherInput {
    
    var container: TransactionContainerProtocol { get }
    var outputCreate: GoalCreateFetcherOutput? { get }
    
    func createGoal(name: String, total: Decimal)
    
}

internal protocol GoalCreateFetcherOutput {
    
    func createGoalSucceeded()
    func createGoalFailed()
    
}

extension GoalCreateFetcherInput {
    
    internal func createGoal(name: String, total: Decimal) {
        let goal = Goal(context: container.viewContext)
        goal.name = name
        goal.isOnGoing = true
        goal.createDate = Date()
        goal.goal = total as NSDecimalNumber
        save(successHanlder: { self.outputCreate?.createGoalSucceeded() }, errorHandler: { self.outputCreate?.createGoalFailed() })
    }
    
    private func save(successHanlder: () -> Void, errorHandler: () -> Void) {
        do {
            try container.saveContext()
            successHanlder()
        } catch {
            errorHandler()
        }
    }
    
}

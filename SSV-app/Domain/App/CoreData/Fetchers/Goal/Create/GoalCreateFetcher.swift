import Foundation


internal protocol GoalCreateFetcherInput {
    
    var container: TransactionContainerProtocol { get }
    var output: GoalCreateFetcherOutput? { get set }
    
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
        goal.value = total as NSDecimalNumber
        save(successHanlder: { self.output?.createGoalSucceeded() }, errorHandler: { self.output?.createGoalFailed() })
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

internal class GoalCreateFetcher: GoalCreateFetcherInput {
    
    internal let container: TransactionContainerProtocol
    
    internal var output: GoalCreateFetcherOutput?
    
    init<Container: TransactionContainerProtocol>(container: Container = TransactionContainer.shared) { self.container = container }
}

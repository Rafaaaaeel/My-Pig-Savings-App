import Foundation

internal protocol GoalUpdateFetcherInput {
    
    var container: TransactionContainerProtocol { get }
    var output: GoalUpdateFetcherOuput? { get set }
    
    func updateGoal(_ goal: Goal, name: String?, total value: Decimal?, saved: Decimal?, isOnGoing: Bool?)
}

internal protocol GoalUpdateFetcherOuput {
    func updateGoalSucceeded()
    func updateGoalFailed()
}

extension GoalUpdateFetcherInput {
    
    internal func updateGoal(_ goal: Goal, name: String?, total value: Decimal?, saved: Decimal?, isOnGoing: Bool?) {
        goal.name = name == nil ? goal.name : name
        goal.goal = value == nil ? goal.value : value.orEmpty as NSDecimalNumber
        goal.value = saved == nil ? goal.value : saved.orEmpty as NSDecimalNumber
        goal.isOnGoing = isOnGoing == nil ? goal.isOnGoing : isOnGoing.orTrue
        
        save(successHanlder: { output?.updateGoalSucceeded() }, errorHandler: { output?.updateGoalFailed() })
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

internal class GoalUpdateFetcher: GoalUpdateFetcherInput {
    
    internal let container: TransactionContainerProtocol
    
    internal var output: GoalUpdateFetcherOuput?
    
    init<Container: TransactionContainerProtocol>(container: Container = TransactionContainer.shared) { self.container = container }
    
}

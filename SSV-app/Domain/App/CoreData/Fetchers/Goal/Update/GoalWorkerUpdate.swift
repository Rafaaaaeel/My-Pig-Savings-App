import Foundation

internal protocol GoalUpdateFetcherInput {
    
    var container: TransactionContainerProtocol { get }
    var outputUpdate: GoalUpdateFetcherOuput? { get }
    
    func updateGoal(_ goal: Goal, name: String?, total value: Decimal?, saved: Decimal?, isOnGoing: Bool?)
}

internal protocol GoalUpdateFetcherOuput {
    func updateGoalSucceeded(_ goal: Goal)
    func updateGoalFailed()
}

extension GoalUpdateFetcherInput {
    
    internal func updateGoal(_ goal: Goal, name: String? = nil, total value: Decimal? = nil, saved: Decimal? = nil, isOnGoing: Bool? = nil) {
        goal.name = name == nil ? goal.name : name
        goal.goal = value == nil ? goal.goal : value.orEmpty as NSDecimalNumber
        goal.value = saved == nil ? goal.value : saved.orEmpty as NSDecimalNumber
        goal.isOnGoing = isOnGoing == nil ? goal.isOnGoing : isOnGoing.orTrue
        
        save(successHanlder: { outputUpdate?.updateGoalSucceeded(goal) }, errorHandler: { outputUpdate?.updateGoalFailed() })
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

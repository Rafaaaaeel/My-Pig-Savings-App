internal protocol GoalDeleteFetcherInput {
    
    var container: TransactionContainerProtocol { get }
    var output: GoalDeleteFetcherOutput? { get set }
    
    func deleteGoal(_ goal: Goal)
}


internal protocol GoalDeleteFetcherOutput {
    
    func deleteGoalSucceeded()
    func deleteGoalFailed()
    
}

extension GoalDeleteFetcherInput {
    
    internal func deleteGoal(_ goal: Goal) {
        container.viewContext.delete(goal)
        save(successHanlder: { output?.deleteGoalSucceeded() }, errorHandler: { output?.deleteGoalFailed() })
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

internal class GoalDeleteFetcher: GoalDeleteFetcherInput {
    
    internal let container: TransactionContainerProtocol
    
    internal var output: GoalDeleteFetcherOutput?
    
    init<Container: TransactionContainerProtocol>(container: Container = TransactionContainer.shared) { self.container = container }
    
}

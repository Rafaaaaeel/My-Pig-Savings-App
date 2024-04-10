internal protocol GoalGetFetcherInput {
    
    var container: TransactionContainerProtocol { get }
    var output: GoalGetFetcherOutput? { get set }
    
    func getGoals()
}

internal protocol GoalGetFetcherOutput {
    
    func getGoalsSucceeded(_ goals: [Goal])
    func getGoalsFailed()
    
}

extension GoalGetFetcherInput {
    
    internal func getGoals() {
        do {
            let goals = try container.viewContext.fetch(Goal.fetchRequest())
            output?.getGoalsSucceeded(goals)
        } catch {
            output?.getGoalsFailed()
        }
    }

}

internal class GoalGetFetcher: GoalGetFetcherInput {
    
    internal let container: TransactionContainerProtocol
    
    internal var output: GoalGetFetcherOutput?
    
    init<Container: TransactionContainerProtocol>(container: Container = TransactionContainer.shared) { self.container = container }
    
}

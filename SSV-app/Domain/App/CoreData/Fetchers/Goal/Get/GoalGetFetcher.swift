internal protocol GoalGetFetcherInput {
    
    var container: TransactionContainerProtocol { get }
    var outputGet: GoalGetFetcherOutput? { get  }
    
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
            outputGet?.getGoalsSucceeded(goals)
        } catch {
            outputGet?.getGoalsFailed()
        }
    }

}

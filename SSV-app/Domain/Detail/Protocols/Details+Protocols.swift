import Foundation

internal protocol DetailInteractorInput {
    
    func saveTransaction(to goal: Goal, _ value: Decimal, operation type: OperationType)
    func updateGoal(_ goal: Goal, newValue: Decimal)
    
}

internal protocol DetailWorkerOutput: TransactionCreateFetcherOutput, GoalUpdateFetcherOuput  { }

internal protocol DetailWorkerInput: TransactionCreateFetcherInput, GoalUpdateFetcherInput {
    
    var container: TransactionContainerProtocol { get }
    var output: DetailWorkerOutput? { get set }

}

internal protocol DetailPresenterInput {
    
    func didFetchGoalUpdated(_ goal: Goal)
    
}

internal protocol DetailPresenterOutput {
    func load(_ goal: Goal)
}


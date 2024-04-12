import Foundation


internal protocol GoalsInteractorInput {
    
    func fetchGoals()
    
}

internal protocol GoalsRouterInput: AppRouterProtocol {
    
    var view: GoalsRouterOutput? { get set }
    
    func close()
    func presentCreation()
    func presentGoal(_ goal: Goal)
    
}

internal protocol GoalsRouterOutput {
    func didClose()
}

internal protocol GoalsPresenterInput {
    
    func didSucceeded(_ goals: [Goal])
    func didFailed()
    
}

internal protocol GoalsViewControllerInput {
    
    func didSucceeded(_ goals: [Goal])
    func didFailed()
    
}

internal protocol GoalsWorkerOutput: GoalGetFetcherOutput { }

internal protocol GoalsWorkerInput: GoalGetFetcherInput {
    
    var container: TransactionContainerProtocol { get }
    var output: GoalsWorkerOutput? { get set }

}

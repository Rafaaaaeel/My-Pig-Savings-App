import Foundation


internal protocol GoalsInteractorInput {
    
    func fetchGoals()
    
}

internal protocol GoalsRouterInput: AppRouterProtocol{
    
    func close()
    
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

}

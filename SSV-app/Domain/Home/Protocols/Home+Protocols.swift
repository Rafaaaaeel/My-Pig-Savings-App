internal protocol HomeRouterInput: AppRouterProtocol {
    
    func presentAchivements()
    func presentCreation()
    func presentGoals()
    
}

internal protocol HomeInteractorInput {
    
    func didLoad()
    
}

internal protocol HomePresenterInput {
    
    func didSucceeded(_ goals: [Goal])
    func didFailed()
    
}

internal protocol HomeViewControllerInput {
    func load(_ state: StateView.State)
}


internal protocol HomeWorkerOutput: GoalGetFetcherOutput { }

internal protocol HomeWorkerInput: GoalGetFetcherInput {
    
    var container: TransactionContainerProtocol { get }

}

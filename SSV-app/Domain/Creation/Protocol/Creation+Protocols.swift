import Foundation


internal protocol CreationInteractorInput {
    
    func didSave(_ model: Creator)
    
}

internal protocol CreationRouterInput: AppRouterProtocol {
    
    func close()
    
}

internal protocol CreationPresenterInput {
    
    func didSucceeded()
    func didFailed()
    
}

internal protocol CreationViewControllerInput {
    
    func didSucceeded()
    func didFailed()
    
}

internal protocol CreationWorkerOutput: GoalCreateFetcherOutput { }

internal protocol CreationWorkerInput: GoalCreateFetcherInput {
    
    var container: TransactionContainerProtocol { get }
    var output: GoalCreateFetcherOutput? { get set }

}


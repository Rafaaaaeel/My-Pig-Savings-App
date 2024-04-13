import Foundation


internal protocol CreationInteractorInput {
    
    func didSave(_ model: Creator)
    
}

internal protocol CreationRouterOutput {
    
    func didClose()
    
}

internal protocol CreationRouterInput: AppRouterProtocol {
    
    var output: CreationRouterOutput? { get set }
    
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
    
    var output: CreationWorkerOutput? { get set }
    
    var container: TransactionContainerProtocol { get }

}


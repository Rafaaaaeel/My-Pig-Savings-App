import Foundation


final internal class CreationInteractor: CreationInteractorInput {
    
    private var worker: CreationWorkerInput
    private let presenter: CreationPresenterInput
    
    internal init<Worker: CreationWorkerInput, Presenter: CreationPresenterInput>(worker: Worker, presenter: Presenter) {
        self.worker = worker
        self.presenter = presenter
        self.worker.output = self
    }
        
    internal func didSave(_ model: Creator) {
        worker.createGoal(name: model.name, total: model.total)
    }
    
}

extension CreationInteractor: CreationWorkerOutput {
    
    internal func createGoalSucceeded() {
        presenter.didSucceeded()
    }
    
    internal func createGoalFailed() {
        presenter.didFailed()
    }
    
}

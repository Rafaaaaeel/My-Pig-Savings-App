import Foundation



final internal class DetailInteractor: DetailInteractorInput {
   
    private var worker: DetailWorkerInput
    private let presenter: DetailPresenterInput
    
    internal init<Worker: DetailWorkerInput, Presenter: DetailPresenterInput>(worker: Worker, presenter: Presenter) {
        self.worker = worker
        self.presenter = presenter
        self.worker.output = self
    }
    
    
    internal func saveTransaction(to goal: Goal, _ value: Decimal, operation type: OperationType) {
        worker.createTransaction(goal, value: value, operation: type)
    }
    
    internal func updateGoal(_ goal: Goal, newValue: Decimal) {
        worker.updateGoal(goal, saved: newValue)
    }
    
}

extension DetailInteractor: DetailWorkerOutput {
    
    internal func updateGoalSucceeded(_ goal: Goal) {
        presenter.didFetchGoalUpdated(goal)
    }
    
    internal func updateGoalFailed() { }
    
    internal func createTransactionSucceeded() { }
    
    internal func createTransactionFailed() {  }
    
}

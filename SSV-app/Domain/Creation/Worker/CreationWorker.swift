import Foundation



final internal class CreationWorker: CreationWorkerInput {
    
    
    internal var container: TransactionContainerProtocol
    internal var output: GoalCreateFetcherOutput?

    
    internal init<Container: TransactionContainerProtocol>(container: Container = TransactionContainer.shared) {
        self.container = container
    }
    
}


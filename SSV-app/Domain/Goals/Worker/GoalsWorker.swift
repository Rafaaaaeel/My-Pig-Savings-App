import Foundation


final internal class GoalsWorker: GoalsWorkerInput {
    
    internal var container: TransactionContainerProtocol
    internal var output: GoalsWorkerOutput?

    internal init<Container: TransactionContainerProtocol>(container: Container = TransactionContainer.shared) {
        self.container = container
    }
    
}

extension GoalsWorker {
    
    var outputGet: GoalGetFetcherOutput? { output }
    
}

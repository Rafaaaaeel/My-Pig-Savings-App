import Foundation


final internal class GoalsWorker: GoalsWorkerInput {
    
    internal var container: TransactionContainerProtocol
    internal var output: GoalGetFetcherOutput?

    internal init<Container: TransactionContainerProtocol>(container: Container = TransactionContainer.shared) {
        self.container = container
    }
    
}


import Foundation

internal protocol HomeWorkerOutput: GoalGetFetcherOutput { }

internal protocol HomeWorkerInput: GoalGetFetcherInput {
    
    var container: TransactionContainerProtocol { get }

}

final internal class HomeWorker: HomeWorkerInput {
    
    internal var container: TransactionContainerProtocol
    internal var output: GoalGetFetcherOutput?

    internal init<Container: TransactionContainerProtocol>(container: Container = TransactionContainer.shared) {
        self.container = container
    }
    
}


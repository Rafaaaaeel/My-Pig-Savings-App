final internal class HomeWorker: HomeWorkerInput {
    
    internal var container: TransactionContainerProtocol
    internal var output: HomeWorkerOutput?

    internal init<Container: TransactionContainerProtocol>(container: Container = TransactionContainer.shared) {
        self.container = container
    }
    
}

extension HomeWorker {
    var outputGet: GoalGetFetcherOutput? { output }
}

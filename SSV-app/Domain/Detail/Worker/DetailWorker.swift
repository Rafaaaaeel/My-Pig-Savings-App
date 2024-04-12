import Foundation


final internal class DetailWorker: DetailWorkerInput {
    
    
    
    
    internal var container: TransactionContainerProtocol
    internal var output: DetailWorkerOutput?

    internal init<Container: TransactionContainerProtocol>(container: Container = TransactionContainer.shared) {
        self.container = container
    }
    
}

extension DetailWorker {
    
    var outputCreate: TransactionCreateFetcherOutput? { output }
    var outputUpdate: GoalUpdateFetcherOuput? { output }
    
}


internal protocol TransactionGetFetcherInput {
    
    var container: TransactionContainerProtocol { get }
    var outputGet: TransactionGetFetcherOutput? { get }
    
    func fetchLastTransactions(of goal: Goal)
}

internal protocol TransactionGetFetcherOutput {
    
    func fetchTransactionsSucceeded(_ transactions: [Transactions])
    
}

extension TransactionGetFetcherInput {
    
    internal func fetchLastTransactions(of goal: Goal) {
        outputGet?.fetchTransactionsSucceeded(goal.lastTransaction)
    }

}

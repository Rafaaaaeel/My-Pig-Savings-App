import Foundation


internal protocol TransactionCreateFetcherInput {
    
    var container: TransactionContainerProtocol { get }
    var outputCreate: TransactionCreateFetcherOutput? { get }
    
    func createTransaction(_ goal: Goal, value: Decimal, operation type: OperationType)
    
}

internal protocol TransactionCreateFetcherOutput {
    
    func createTransactionSucceeded()
    func createTransactionFailed()
    
}

extension TransactionCreateFetcherInput {
    
    internal func createTransaction(_ goal: Goal, value: Decimal, operation type: OperationType) {
        let transaction = Transactions(context: container.viewContext)
        transaction.Operation = type
        transaction.value = value as NSDecimalNumber
        transaction.editionDate = Date()
        goal.addToTransactions(transaction)
        save(successHanlder: { outputCreate?.createTransactionSucceeded() }, errorHandler: { outputCreate?.createTransactionFailed() })
    }
    
    private func save(successHanlder: () -> Void, errorHandler: () -> Void) {
        do {
            try container.saveContext()
            successHanlder()
        } catch {
            errorHandler()
        }
    }
    
}

final internal class CreationRouter: AppRouter, CreationRouterInput {
    
    var output: (any CreationRouterOutput)?
    
    
    internal func close() {
        dismiss()
        output?.didClose()
    }
    
}

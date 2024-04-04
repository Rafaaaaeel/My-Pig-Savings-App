internal protocol CreationRouterInput: AppRouterProtocol {
    func close()
}

final internal class CreationRouter: AppRouter, CreationRouterInput {
    
    internal func close() {
        dismiss()
    }
    
}

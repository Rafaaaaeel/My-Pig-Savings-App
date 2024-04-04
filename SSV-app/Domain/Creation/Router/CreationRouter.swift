internal protocol CreationRouterInput: AppRouterProtocol {
    func close()
}

final internal class CreationRouter: AppRouter, CreationRouterInput {
    
    func close() {
        dismiss()
    }
    
}

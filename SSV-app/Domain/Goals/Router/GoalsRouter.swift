internal protocol GoalsRouterInput: AppRouterProtocol{
    
    func close()
    
}


final internal class GoalsRouter: AppRouter, GoalsRouterInput {
    
    internal func close() {
        dismiss()
    }
    
}

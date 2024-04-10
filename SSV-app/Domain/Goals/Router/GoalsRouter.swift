final internal class GoalsRouter: AppRouter, GoalsRouterInput {
    
    internal var view: GoalsRouterOutput?
    
    internal func presentCreation() {
        present(CreationConfigurator.view())
    }
    
    internal func presentGoal(_ goal: Goal) {
        
    }
    
    internal func close() {
        dismiss()
    }
    
}

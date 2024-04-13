final internal class GoalsRouter: AppRouter, GoalsRouterInput {
    
    internal var view: GoalsRouterOutput?
    
    internal func presentCreation(_ output: CreationRouterOutput) {
        present(CreationConfigurator.view(output))
    }
    
    internal func presentGoal(_ goal: Goal) {
        moveTo(DetailConfigurator.view(goal))
    }
    
    internal func close() {
        dismiss()
    }
    
}

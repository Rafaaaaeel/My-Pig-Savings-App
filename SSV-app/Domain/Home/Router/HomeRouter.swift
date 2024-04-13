final internal class HomeRouter: AppRouter, HomeRouterInput {
    
    internal func presentEditUser() {
        moveTo(IntroConfigurator.view())
    }
    
    internal func presentGoals() {
        moveTo(GoalsConfigurator.view())
    }
    
    internal func presentAchivements() {
        moveTo(AchivementViewController())
    }
    
    internal func presentCreation(_ output: CreationRouterOutput) {
        present(CreationConfigurator.view(output), style: .overFullScreen)
    }
    
}

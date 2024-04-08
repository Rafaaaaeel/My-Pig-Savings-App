final internal class HomeRouter: AppRouter, HomeRouterInput {
    
    internal func presentGoals() {
        moveTo(GoalsConfigurator.view())
    }
    
    internal func presentAchivements() {
        moveTo(AchivementViewController())
    }
    
    internal func presentCreation() {
        present(CreationConfigurator.view(), style: .overFullScreen)
    }
    
}

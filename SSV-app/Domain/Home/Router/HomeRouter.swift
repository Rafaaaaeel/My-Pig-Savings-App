final internal class HomeRouter: AppRouter, HomeRouterInput {
    
    internal func presentAchivements() {
        moveTo(AchivementViewController())
    }
    
    internal func presentCreation() {
        present(CreationConfigurator.view(), style: .overFullScreen)
    }
    
}

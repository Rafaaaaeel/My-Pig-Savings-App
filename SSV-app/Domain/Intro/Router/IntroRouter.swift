final internal class IntroRouter: AppRouter, IntroRouterInput {
    
    internal func presentHome() {
        rootViewController(HomeConfigurator.view())
    }
    
}

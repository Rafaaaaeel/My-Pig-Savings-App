final class IntroRouter: AppRouter, IntroRouterInput {
    
    func presentHome() {
        rootViewController(HomeConfigurator.view())
    }
    
}

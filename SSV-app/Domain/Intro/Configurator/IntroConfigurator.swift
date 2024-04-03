internal class IntroConfigurator {
    
    static func view() -> MyPigViewController {
        return IntroViewController(interactor: IntroInteractor(), router: IntroRouter())
    }
    
}

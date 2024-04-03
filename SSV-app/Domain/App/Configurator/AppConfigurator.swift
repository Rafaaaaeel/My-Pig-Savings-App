final public class AppConfigurator {
    
    static func view() -> MyPigViewController {
        guard !SessionManager.shared.isFirstTime else {
            return IntroConfigurator.view()
        }
        return HomeConfigurator.view()
    }
    
}

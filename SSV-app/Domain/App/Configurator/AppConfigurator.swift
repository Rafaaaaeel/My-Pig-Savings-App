final public class AppConfigurator {
    
    static func view() -> MyPigViewController {
        guard !SessionManager.shared.isFirstTime && SessionManager.shared.userName.isNotEmpty else {
            return IntroConfigurator.view()
        }
        return HomeConfigurator.view()
    }
    
}

final public class AppConfigurator {
    
    static func view() -> MyPigViewController {
        guard false else {//!SessionManager.shared.isFirstTime && SessionManager.shared.userName.isNotEmpty else {
            return IntroConfigurator.view()
        }
        return HomeConfigurator.view()
    }
    
}

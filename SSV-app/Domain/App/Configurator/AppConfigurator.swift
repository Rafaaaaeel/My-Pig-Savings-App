import UIKit


final public class AppConfigurator {
    static func view() -> UIViewController {
        
        guard !SessionManager.shared.isFirstTime else {
            return IntroViewController(interactor: IntroInteractor(), router: IntroRouter())//HomeViewController(router: router)
        }
        
        return HomeViewController(router: HomeRouter())
    }
}

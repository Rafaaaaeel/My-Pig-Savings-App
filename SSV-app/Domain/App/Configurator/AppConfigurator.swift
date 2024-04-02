import UIKit

final class AppConfigurator {
    static func view() -> UIViewController {
        
        guard false else {// SessionManager.shared.isFirstTime else {
            return IntroViewController(interactor: IntroInteractor(), router: IntroRouter())//HomeViewController(router: router)
        }
        
        return HomeViewController(router: HomeRouter())
    }
}

import UIKit


final public class AppConfigurator {
    
    static func view() -> UIViewController {
        guard !SessionManager.shared.isFirstTime else {
            let router = IntroRouter()
            let controller = IntroViewController(interactor: IntroInteractor())
            router.currentViewController = controller
            controller.router = router
            return controller
        }
        
        let controller = HomeViewController()
        let router = HomeRouter()
        router.currentViewController = controller
        controller.router = router
        return controller
    }
    
}

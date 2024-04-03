import UIKit

final internal class HomeConfigurator {
    
    static internal func view() -> UIViewController {
        let router = HomeRouter()
        let controller = HomeViewController()
        router.currentViewController = controller
        controller.router = router
        return controller
    }
    
}

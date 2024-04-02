import UIKit

final internal class HomeConfigurator {
    
    static internal func view() -> UIViewController {
        let router = HomeRouter()
        return HomeViewController(router: router)
    }
    
}

import UIKit

final internal class HomeConfigurator {
    
    static internal func view() -> UIViewController {
        return HomeViewController(router: HomeRouter())
    }
    
}

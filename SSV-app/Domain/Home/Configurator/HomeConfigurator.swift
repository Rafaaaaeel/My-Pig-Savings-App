import UIKit

final class HomeConfigurator {
    
    static func view() -> UIViewController {
        let router = HomeRouter()
        return HomeViewController(router: router)
    }
    
}

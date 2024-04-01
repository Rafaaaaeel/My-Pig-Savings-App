import UIKit

final class AppConfigurator {
    static func view() -> UIViewController {
        let router = HomeRouter()
        return HomeViewController(router: router)
    }
}

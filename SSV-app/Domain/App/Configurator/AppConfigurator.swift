import UIKit

final class AppConfigurator {
    static func view() -> UIViewController {
        let router = HomeRouter()
        return IntroViewController()//HomeViewController(router: router)
    }
}

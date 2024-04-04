import UIKit

final internal class CreationConfigurator {
    
    static internal func view() -> UINavigationController {
        return UINavigationController(rootViewController: CreationViewController(router: CreationRouter(), interactor: CreationInteractor()))
    }
    
}

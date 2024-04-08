import UIKit


final internal class GoalsConfigurator {
    
    static internal func view() -> MyPigViewController {
        let router = GoalsRouter()
        let controller = GoalsViewController(router: router)
        return controller
    }
    
}

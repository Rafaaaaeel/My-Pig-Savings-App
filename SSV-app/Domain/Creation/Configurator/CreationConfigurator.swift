import UIKit

final internal class CreationConfigurator {
    
    static internal func view(_ output: CreationRouterOutput?) -> UINavigationController {
        let router = CreationRouter()
        let worker = CreationWorker()
        let presenter = CreationPresenter()
        let interactor = CreationInteractor(worker: worker, presenter: presenter)
        let controller = CreationViewController(router: router, interactor: interactor)
        
        router.output = output
        presenter.view = controller
        
        return UINavigationController(rootViewController: controller)
    }
    
}

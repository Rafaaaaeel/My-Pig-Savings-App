final internal class HomeConfigurator {
    
    static internal func view() -> MyPigViewController {
    
        let name = SessionManager.shared.userName
        let worker = HomeWorker()
        let presenter = HomePresenter()
        let interactor = HomeInteractor(worker: worker, presenter: presenter)
        let router = HomeRouter()
        let controller = HomeViewController(name: name, router: router, interactor: interactor)
        
        presenter.view = controller
        
        return controller
    }
    
}

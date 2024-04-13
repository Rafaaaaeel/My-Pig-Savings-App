final internal class GoalsConfigurator {
    
    static internal func view() -> MyPigViewController {
        let router = GoalsRouter()
        let worker = GoalsWorker()
        let presenter = GoalsPresenter()
        let interactor = GoalsInteractor(worker: worker, presenter: presenter)
        let controller = GoalsViewController(interactor: interactor, router: router)
        
        presenter.view = controller
        
        return controller
    }
    
}

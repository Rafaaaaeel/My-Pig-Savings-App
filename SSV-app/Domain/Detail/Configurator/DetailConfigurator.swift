final class DetailConfigurator {
    
    static func view(_ goal: Goal) -> MyPigViewController {
        let worker = DetailWorker()
        let presenter = DetailPresenter()
        let interactor = DetailInteractor(worker: worker, presenter: presenter)
        let controller = DetailViewController(detail: goal, interactor: interactor)
        
        presenter.view = controller
        
        return controller
    }
    
}

final internal class HomeInteractor: HomeInteractorInput {
   
    private var worker: HomeWorkerInput
    private let presenter: HomePresenterInput
    private let session: SessionManagerProtocol
     
    
    internal init<Worker: HomeWorkerInput, 
                    Session: SessionManagerProtocol,
                    Presenter: HomePresenterInput>(worker: Worker,
                                                   presenter: Presenter,
                                                   session: Session = SessionManager.shared) {
        self.worker = worker
        self.session = session
        self.presenter = presenter
        self.worker.output = self
    }
    
    internal func didLoad() {
        session.logged()
        fetchGoals()
    }
    
}

extension HomeInteractor: HomeWorkerOutput {
    
    internal func getGoalsSucceeded(_ goals: [Goal]) {
        presenter.didSucceeded(goals)
    }
    
    internal func getGoalsFailed() {
        presenter.didFailed()
    }
    
}

extension HomeInteractor {
    
    private func fetchGoals() {
        worker.getGoals()
    }
    
}

final internal class GoalsInteractor: GoalsInteractorInput {
   
    private var worker: GoalsWorkerInput
    private let presenter: GoalsPresenterInput
     
    
    internal init<Worker: GoalsWorkerInput,
                    Presenter: GoalsPresenterInput>(worker: Worker, presenter: Presenter) {
        self.worker = worker
        self.presenter = presenter
        self.worker.output = self
    }
    
    internal func fetchGoals() {
        worker.getGoals()
    }
    
}

extension GoalsInteractor: GoalsWorkerOutput {
    
    internal func getGoalsSucceeded(_ goals: [Goal]) {
        presenter.didSucceeded(goals)
    }
    
    internal func getGoalsFailed() {
        presenter.didFailed()
    }
    
}

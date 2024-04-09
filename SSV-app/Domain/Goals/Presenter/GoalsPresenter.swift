final internal class GoalsPresenter: GoalsPresenterInput {
    
    internal var view: GoalsViewControllerInput?
    
    internal func didSucceeded(_ goals: [Goal]) {
        view?.didSucceeded(goals)
    }
    
    internal func didFailed() {
        view?.didFailed()
    }
    
}

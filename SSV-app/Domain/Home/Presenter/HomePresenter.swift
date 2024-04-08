final internal class HomePresenter: HomePresenterInput {
    
    internal var view: HomeViewControllerInput?
    
    internal func didSucceeded(_ goals: [Goal]) {
        view?.load(goals.isEmpty ? .empty : .nonEmpty)
    }
    
    internal func didFailed() {
        view?.load(.empty)
    }
    
}

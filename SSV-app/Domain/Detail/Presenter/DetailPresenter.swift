final internal class DetailPresenter: DetailPresenterInput {
    
    internal var view: DetailPresenterOutput?
    
    internal func didFetchGoalUpdated(_ goal: Goal) {
        view?.load(goal)
    }
    
}

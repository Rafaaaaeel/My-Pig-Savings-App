internal protocol DetailPresenterInput {
    
    func didFetchGoalUpdated(_ goal: Goal)
    
}

internal protocol DetailPresenterOutput {
    func load(_ goal: Goal)
}

final internal class DetailPresenter: DetailPresenterInput {
    
    internal var view: DetailPresenterOutput?
    
    internal func didFetchGoalUpdated(_ goal: Goal) {
        view?.load(goal)
    }
    
}

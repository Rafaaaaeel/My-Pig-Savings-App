final internal class CreationPresenter: CreationPresenterInput {
    
    internal var view: CreationViewControllerInput?
    
    internal func didSucceeded() {
        view?.didSucceeded()
    }
    
    internal func didFailed() {
        view?.didFailed()
    }
    
}

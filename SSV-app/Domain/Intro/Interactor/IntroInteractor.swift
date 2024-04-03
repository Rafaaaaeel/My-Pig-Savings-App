final internal class IntroInteractor: IntroInteractorInput {
        
    private var session: SessionManagerProtocol
    
    internal init<Session: SessionManagerProtocol>(session: Session = SessionManager.shared) {
        self.session = session
    }
    
    internal func didSaveUserName(_ input: String, completion: @escaping () -> Void) {
        session.userName = input
        completion()
    }
    
}

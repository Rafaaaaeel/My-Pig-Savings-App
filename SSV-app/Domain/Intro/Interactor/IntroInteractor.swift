final class IntroInteractor: IntroInteractorInput {
    
    private var session: SessionManagerProtocol
    
    init<Session: SessionManagerProtocol>(session: Session = SessionManager.shared) {
        self.session = session
    }
    
    func didSaveUserName(_ input: String, completion: @escaping () -> Void) {
        session.userName = input
        completion()
    }
    
}

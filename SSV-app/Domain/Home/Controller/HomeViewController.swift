import UIKit


final internal class HomeViewController: UIViewController {

    internal var router: HomeRouterInput?
    
    private lazy var homeView = HomeView(user: session.userName)
    private let session: SessionManagerProtocol
    
    internal init<Session: SessionManagerProtocol>(session: Session = SessionManager.shared) {
        self.session = session
        super.init(nibName: nil, bundle: nil)
        self.session.logged()
    }
    
    required init?(coder: NSCoder) { nil }
    
    internal override func loadView() {
        super.loadView()
        homeView.delegate = self
        self.view = homeView
    }
    
}

extension HomeViewController: HomeViewDelegate {
    
    internal func didTouchCreate() {
        router?.presentCreation()
    }
    
    internal func didTouchSummary() {
        router?.presentAchivements()
    }
    
}

import UIKit


final internal class HomeViewController: MyPigViewController {
    
    private lazy var homeView = HomeView(user: session.userName)
    
    private let router: HomeRouterInput
    private let session: SessionManagerProtocol
    
    internal init<Router: HomeRouterInput, Session: SessionManagerProtocol>(router: Router, session: Session = SessionManager.shared) {
        self.router = router
        self.session = session
        super.init(nibName: nil, bundle: nil)
        self.router.currentViewController = self
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
        router.presentCreation()
    }
    
    internal func didTouchSummary() {
        router.presentAchivements()
    }
    
}

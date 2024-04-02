import UIKit


final internal class HomeViewController: UIViewController {
    
    private lazy var homeView = HomeView()
    
    private let router: HomeRouterInput
    
    internal init<Router: HomeRouterInput>(router: Router) {
        self.router = router
        super.init(nibName: nil, bundle: nil)
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

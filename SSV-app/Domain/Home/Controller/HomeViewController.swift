import UIKit

final class HomeViewController: UIViewController {
    
    private lazy var homeView = HomeView()
    
    private let router: HomeRouterInput
    
    init(router: HomeRouterInput) {
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { nil }
    
    override func loadView() {
        super.loadView()
        homeView.delegate = self
        self.view = homeView
    }
    
}

extension HomeViewController: HomeViewDelegate {
    
    func didTouchCreate() {
        router.presentCreation()
    }
    
    func didTouchSummary() {
        router.presentAchivements()
    }
    
}

import UIKit

final class HomeViewController: UIViewController {
    
    private lazy var homeView = HomeView()
    
    override func loadView() {
        super.loadView()
        homeView.delegate = self
        self.view = homeView
    }
    
}

extension HomeViewController: HomeViewDelegate {
    
    func didTouchCreate() {
        print("a")
    }
    
    func didTouchSummary() {
        print("b")
    }
    
}

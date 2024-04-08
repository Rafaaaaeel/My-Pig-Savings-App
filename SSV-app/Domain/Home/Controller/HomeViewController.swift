import UIKit


final internal class HomeViewController: MyPigViewController {
    
    private let name: String
    private let router: HomeRouterInput
    private let interactor: HomeInteractorInput
    
    private lazy var homeView = HomeView(user: name)

    internal init<Router: HomeRouterInput, Interactor: HomeInteractorInput>(name: String, router: Router, interactor: Interactor) {
        self.name = name
        self.router = router
        self.interactor = interactor
        super.init()
        self.router.currentViewController = self
    }
    
    required init?(coder: NSCoder) { nil }
    
    internal override func viewDidLoad() {
        super.viewDidLoad()
        interactor.didLoad()
    }
    
    internal override func loadView() {
        super.loadView()
        homeView.delegate = self
        self.view = homeView
    }
    
}

extension HomeViewController: HomeViewDelegate {
    
    internal func didTouchShowGoals() {
        router.presentGoals()
    }
    
    internal func didTouchCreate() {
        router.presentCreation()
    }
    
    internal func didTouchSummary() {
        router.presentAchivements()
    }
    
}

extension HomeViewController: HomeViewControllerInput {
    
    internal func load(_ state: StateView.State) {
        homeView.state = state
    }
    
}

import Foundation

final internal class GoalsViewController: MyPigViewController {
    
    private let interactor: GoalsInteractorInput
    private let router: GoalsRouterInput
    
    private lazy var goalsView = GoalsView()
    
    internal init<Interactor: GoalsInteractorInput, Router: GoalsRouterInput>(interactor: Interactor, router: Router) {
        self.interactor = interactor
        self.router = router
        super.init()
        self.router.currentViewController = self
        configureNavigation()
    }
    
    internal override func viewDidLoad() {
        super.viewDidLoad()
        interactor.fetchGoals()
    }
    
    required init?(coder: NSCoder) { nil }
    
    internal override func loadView() {
        super.loadView()
        goalsView.delegate = self
        self.view = goalsView
    }
    
    private func configureNavigation() {
        let button = AddButton()
        button.delegate = self
        setNavigationButton(button, direction: .right)
    }
    
}

extension GoalsViewController: AddButtonDelegate {
    
    func didTouchButton() {
        router.presentCreation()
    }
    
}

extension GoalsViewController: GoalsViewControllerInput {
    
    internal func didSucceeded(_ goals: [Goal]) {
        goalsView.update(goals)
    }
    
    internal func didFailed() { }
    
}

extension GoalsViewController: GoalsViewDelegate {
    
    internal func didSelectGoal(_ goal: Goal) {
        router.presentGoal(goal)
    }
    
}

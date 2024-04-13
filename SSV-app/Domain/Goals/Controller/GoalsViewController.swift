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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
        setNavigationTitle("Goals")
        setNavigationButton(button, direction: .right)
    }
    
}

extension GoalsViewController: AddButtonDelegate {
    
    internal func didTouchButton() {
        router.presentCreation(self)
    }
    
}

extension GoalsViewController: CreationRouterOutput {
    
    func didClose() {
        interactor.fetchGoals()
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

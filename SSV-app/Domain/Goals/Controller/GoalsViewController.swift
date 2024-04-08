import Foundation

final internal class GoalsViewController: MyPigViewController {
    
    private let router: GoalsRouterInput
    
    private lazy var goalsView = GoalsView()
    
    internal init<Router: GoalsRouterInput>(router: Router) {
        self.router = router
        super.init()
        self.router.currentViewController = self
    }
    
    required init?(coder: NSCoder) { nil }
    
    internal override func loadView() {
        super.loadView()
        self.view = goalsView
    }
    
    private func configNav() {
        
    }
    
}

import UIKit


final internal class CreationViewController: MyPigViewController {
    
    private lazy var creationView = CreationView()
    
    private let router: CreationRouterInput
    
    init<Router: CreationRouterInput>(router: Router) {
        self.router = router
        super.init(nibName: nil, bundle: nil)
        self.router.currentViewController = self
    }
    
    required init?(coder: NSCoder) { nil }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        configNav()
    }
    
    override func loadView() {
        super.loadView()
        self.view = creationView
    }
    
    private func configNav() {
        let button = CloseButton()
        button.delegate = self
        setNavigationButton(button, direction: .right)
        setNavigationTitle("Setting up goal")
    }
    
}

extension CreationViewController: CloseButtonDelegate {
    
    func didTouchButton() {
        router.close()
    }
    
}

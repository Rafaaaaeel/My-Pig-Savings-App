import UIKit


final internal class CreationViewController: MyPigViewController {
    
    private lazy var creationView = CreationView()
    
    private let router: CreationRouterInput
    private let interactor: CreationInteractorInput
    
    init<Router: CreationRouterInput, Interactor: CreationInteractorInput>(router: Router, interactor: Interactor) {
        self.router = router
        self.interactor = interactor
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

extension CreationViewController: CreationViewDelegate {
    
    func didTouchSave(_ model: Creator) {
        
    }
    
}

extension CreationViewController: CloseButtonDelegate {
    
    func didTouchButton() {
        router.close()
    }
    
}

import UIKit


final internal class CreationViewController: MyPigViewController {
    
    private lazy var creationView = CreationView()
    
    private let router: CreationRouterInput
    private let interactor: CreationInteractorInput
    
    init<Router: CreationRouterInput, Interactor: CreationInteractorInput>(router: Router, interactor: Interactor) {
        self.router = router
        self.interactor = interactor
        super.init()
        self.router.currentViewController = self
    }
    
    required init?(coder: NSCoder) { nil }
        
    internal override func viewDidLoad() {
        super.viewDidLoad()
        configNav()
    }
    
    internal override func loadView() {
        super.loadView()
        creationView.delegate = self
        self.view = creationView
    }
    
    private func configNav() {
        let button = CloseButton()
        button.delegate = self
        setNavigationButton(button, direction: .right)
        setNavigationTitle("Setting up goal")
    }
    
}

extension CreationViewController: CreationViewControllerInput {
    
    func didSucceeded() {
        router.close()
    }
    
    func didFailed() {
        print("ERROR =======> ERROR")
    }
    
}

extension CreationViewController: CreationViewDelegate {
    
    internal func didTouchSave(_ model: Creator) {
        interactor.didSave(model)
    }
    
}

extension CreationViewController: CloseButtonDelegate {
    
    internal func didTouchButton() {
        router.close()
    }
    
}

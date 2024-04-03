import UIKit


final internal class IntroViewController: MyPigViewController {
    
    private let interactor: IntroInteractorInput
    private let router: IntroRouterInput
    
    private lazy var introView = IntroView()
    
    internal init<Interactor: IntroInteractorInput, Router: IntroRouterInput>(interactor: Interactor, router: Router) {
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
        self.router.currentViewController = self
    }
    
    required init?(coder: NSCoder) { nil }
    
    internal override func loadView() {
        super.loadView()
        introView.delegate = self
        self.view = introView
    }
    
}

extension IntroViewController: IntroViewDelegate {
    
    internal func didText(_ text: String) {
        interactor.didSaveUserName(text) { [weak self] in
            self?.router.presentHome()
        }
    }
    
}

import UIKit


final class IntroViewController: UIViewController {
    
    private let interactor: IntroInteractorInput
    private let router: IntroRouterInput
    
    private lazy var introView = IntroView()
    
    init<Interactor: IntroInteractorInput, Router: IntroRouterInput>(interactor: Interactor, router: Router) {
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { nil }
    
    override func loadView() {
        super.loadView()
        introView.delegate = self
        self.view = introView
    }
}


extension IntroViewController: IntroViewDelegate {
    
    func didText(_ text: String) {
        interactor.didSaveUserName(text) { [weak self] in
            self?.router.presentHome()
        }
    }
    
    
}

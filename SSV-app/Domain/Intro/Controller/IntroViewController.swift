import UIKit


final internal class IntroViewController: UIViewController {
    
    internal var router: IntroRouterInput?
    
    private let interactor: IntroInteractorInput
    private lazy var introView = IntroView()
    
    internal init<Interactor: IntroInteractorInput>(interactor: Interactor) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
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
            self?.router?.presentHome()
        }
    }
    
}

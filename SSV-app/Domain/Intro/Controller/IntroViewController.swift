import UIKit


final class IntroViewController: UIViewController {
    
    // interactor
    // router
    
    private lazy var introView = IntroView()
    
    override func loadView() {
        super.loadView()
        self.view = introView
    }
}

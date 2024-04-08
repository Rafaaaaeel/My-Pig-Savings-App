import UIKit

public class MyPigViewController: UIViewController {
    
    public enum NavButtonDirection {
        case right
        case left
    }
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        customBackbutton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setNavigationTitle(_ input: String) {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: ColorTheme.secondaryTile]
        navigationItem.title = input
    }
    
    public func setNavigationButton(_ button: UIBarButtonItem, direction: NavButtonDirection) {
        
        switch direction {
        case .right:
            navigationItem.rightBarButtonItem = button
        case .left:
            navigationItem.leftBarButtonItem = button
        }
        
    }
    
    private func customBackbutton() {
        let yourBackImage = Images.App.arrow_left
        navigationItem.backBarButtonItem = UIBarButtonItem(image: yourBackImage, style: .plain, target: nil, action: nil)
    }
    
}

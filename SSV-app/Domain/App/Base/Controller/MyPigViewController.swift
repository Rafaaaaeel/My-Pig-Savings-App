import UIKit

public class MyPigViewController: UIViewController {
    
    public enum NavButtonDirection {
        case right
        case left
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
    
}

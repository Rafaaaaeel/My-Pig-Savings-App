import UIKit

public class AppRouter {
    
    public var currentViewController: UIViewController?
    
    public func moveTo(_ controller: UIViewController) {
        currentViewController?.navigationController?.pushViewController(controller, animated: true)
    }
    
    public func rootViewController(_ controller: UIViewController) {
        guard let window = UIApplication.shared.connectedScenes.flatMap({ ($0 as? UIWindowScene)?.windows ?? [] }).last else { return }
        window.rootViewController = controller
        currentViewController = controller
    }
    
}

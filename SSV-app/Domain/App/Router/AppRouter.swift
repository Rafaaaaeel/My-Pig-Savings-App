import UIKit

public protocol AppRouterProtocol: AnyObject {
    var currentViewController: UIViewController? { get set }
}

public class AppRouter: AppRouterProtocol {
    
    public var currentViewController: UIViewController?
    
    public func present(_ controller: UIViewController, style: UIModalPresentationStyle = .overCurrentContext, completion: (() -> Void)? = nil) {
        controller.modalPresentationStyle = style
        currentViewController?.present(controller, animated: true, completion: completion)
    }
    
    public func moveTo(_ controller: UIViewController) {
        currentViewController?.navigationController?.pushViewController(controller, animated: true)
    }
    
    public func rootViewController(_ controller: UIViewController) {
        guard let window = UIApplication.shared.connectedScenes.flatMap({ ($0 as? UIWindowScene)?.windows ?? [] }).last else { return }
        window.rootViewController = controller
        currentViewController = controller
    }
    
}

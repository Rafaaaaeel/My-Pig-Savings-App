import UIKit

internal protocol IntroInteractorInput: AnyObject {
    
    func didSaveUserName(_ input: String, completion: @escaping () -> Void)
    
}

internal protocol IntroRouterInput: AppRouterProtocol {
    
    func presentHome()
    
}


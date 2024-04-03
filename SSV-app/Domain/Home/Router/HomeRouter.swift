import UIKit
final internal class HomeRouter: AppRouter, HomeRouterInput {
    
    internal func presentAchivements() {
        print("a")
    }
    
    internal func presentCreation() {
        present(CreationViewController(), style: .overFullScreen)
    }
    
}

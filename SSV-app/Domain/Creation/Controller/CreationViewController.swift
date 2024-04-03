import UIKit


final internal class CreationViewController: UIViewController {
    
    private let creationView = CreationView()
    
    override func loadView() {
        super.loadView()
        self.view = creationView
    }
    
}

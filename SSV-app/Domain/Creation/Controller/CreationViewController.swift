import UIKit


final internal class CreationViewController: MyPigViewController {
    
    private let creationView = CreationView()
    
    override func loadView() {
        super.loadView()
        self.view = creationView
    }
    
}

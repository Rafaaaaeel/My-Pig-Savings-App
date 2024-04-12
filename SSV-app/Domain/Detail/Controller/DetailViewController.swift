import UIKit


final internal class DetailViewController: MyPigViewController {
 
    private let goal: Goal
    
    private lazy var detailView = DetailView(goal)
    
    internal init(detail goal: Goal) {
        self.goal = goal
        super.init()
    }
    
    required init?(coder: NSCoder) { nil }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationTitle("Savings Tracker")
    }
    
    internal override func loadView() {
        super.loadView()
        self.view = detailView
    }
    
}

import UIKit


final internal class DetailViewController: MyPigViewController {
 
    private var goal: Goal {
        didSet {
            detailView.goal = goal
        }
    }
    
    private let interactor: DetailInteractorInput
    
    private lazy var detailView = DetailView(goal)
    
    internal init<Interactor: DetailInteractorInput>(detail goal: Goal, interactor: Interactor) {
        self.goal = goal
        self.interactor = interactor
        super.init()
    }
    
    required init?(coder: NSCoder) { nil }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationTitle("Savings Tracker")
    }
    
    internal override func loadView() {
        super.loadView()
        detailView.delegate = self
        self.view = detailView
    }
    
}

extension DetailViewController: DetailViewDelegate {
    
    func didChangeValue(_ newValue: Decimal, _ value: Decimal, operation type: OperationType) {
        interactor.saveTransaction(to: goal, value, operation: type)
        interactor.updateGoal(goal, newValue: newValue)
    }
    
}

extension DetailViewController: DetailPresenterOutput {
    
    internal func load(_ goal: Goal) {
        self.goal = goal
    }
    
}

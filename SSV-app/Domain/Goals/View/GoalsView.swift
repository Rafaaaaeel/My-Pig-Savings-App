import UIKit


internal protocol GoalsViewDelegate: AnyObject {
    
    func didSelectGoal(_ goal: Goal)
    
}

final internal class GoalsView: WhiteView {
    
    private lazy var tableView = GoalsTableView()
    
    internal weak var delegate: GoalsViewDelegate?
    
    internal override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) { nil }
    
    public func update(_ goals: [Goal]) {
        tableView.update(goals)
    }
    
}

extension GoalsView: CodableViews {
    
    internal func configView() {
        tableView.tableDelegate = self
    }
    
    internal func setupHiearchy() {
        addSubview(tableView)
    }
    
    internal func setupContraints() {
        let constraints = [
            tableView.topAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 0),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}

extension GoalsView: GoalsTableViewDelegate {
    
    internal func didSelectGoal(_ goal: Goal) {
        delegate?.didSelectGoal(goal)
    }
    
}


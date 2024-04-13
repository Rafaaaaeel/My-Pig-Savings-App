import UIKit


internal protocol GoalsViewDelegate: AnyObject {
    
    func didSelectGoal(_ goal: Goal)
    
}

final internal class GoalsView: WhiteView {
    
    private lazy var tableView: GoalsTableView = {
       let table = GoalsTableView()
        table.tableDelegate = self
        return table
    }()
    
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
    
    internal func setupHiearchy() {
        addSubview(tableView)
    }
    
    internal func setupContraints() {
        let constraints = [
            tableView.topAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 0),
            tableView.leadingAnchor.constraint(equalToSystemSpacingAfter: safeAreaLayoutGuide.leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: tableView.trailingAnchor, multiplier: 1),
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


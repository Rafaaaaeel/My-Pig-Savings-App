import UIKit


internal protocol GoalsTableViewDelegate: AnyObject {
    
    func didSelectGoal(_ goal: Goal)
    
}

final internal class GoalsTableView: UITableView {
    
    private let source: GoalsTableDataSource
    
    internal weak var tableDelegate: GoalsTableViewDelegate?
    
    internal init(source: GoalsTableDataSource = GoalsTableDataSource()) {
        self.source = source
        super.init(frame: .zero, style: .plain)
        configure()
    }
    
    required init?(coder: NSCoder) { nil }
    
    internal func update(_ data: [Goal]) {
        source.sections = data
        reloadData()
    }
    
}

extension GoalsTableView {
    
    private func configure() {
        rowHeight = 140
        delegate = self
        backgroundColor = .clear
        dataSource = source
        separatorStyle = .none
        showsVerticalScrollIndicator = false
        translatesAutoresizingMaskIntoConstraints = false
        register(CardsTableViewCell.self, forCellReuseIdentifier: CardsTableViewCell.identifier)
        tableHeaderView = GoalsTableHeaderView(frame: CGRect(x: 0, y: 0, width: Frame.width, height: 100))
    }
    
}

extension GoalsTableView: UITableViewDelegate {
    
    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        tableDelegate?.didSelectGoal(source.select(row: indexPath.row))
    }
    
}

extension UIView {
    func applyGradient(colors: [UIColor]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
}

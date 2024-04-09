import UIKit


final internal class GoalsTableView: UITableView {
    
    private let source: GoalsTableDataSource
    
    internal init(source: GoalsTableDataSource = GoalsTableDataSource()) {
        self.source = source
        super.init(frame: .zero, style: .plain)
        configure()
    }
    
    required init?(coder: NSCoder) { nil }
    
    internal func update(_ data: [Goal]) {
        source.sections = data
    }
    
}

extension GoalsTableView {
    
    private func configure() {
        dataSource = source
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
        tableHeaderView = GoalsTableHeaderView(frame: CGRect(x: 0, y: 0, width: Frame.width, height: 50))
        source.delegate = self
    }
    
}

extension GoalsTableView: GoalsTableDataSourceDelegate {
    
    internal func reload() {
        reloadData()
    }
    
}

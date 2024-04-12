import UIKit


final internal class TransactionTableView: UITableView {
    
    private let source: TransactionTableDataSource
    
//    internal weak var tableDelegate: GoalsTableViewDelegate?
    
    internal init(source: TransactionTableDataSource = TransactionTableDataSource()) {
        self.source = source
        super.init(frame: .zero, style: .plain)
        configure()
    }
    
    required init?(coder: NSCoder) { nil }
    
    internal func update(_ data: [Transactions]) {
        source.sections = data
        reloadData()
    }
    
}

extension TransactionTableView {
    
    private func configure() {
        rowHeight = 60
        delegate = self
        isScrollEnabled = false
        backgroundColor = .clear
        dataSource = source
        showsVerticalScrollIndicator = false
        translatesAutoresizingMaskIntoConstraints = false
        register(LastTransactionsTableViewCell.self, forCellReuseIdentifier: LastTransactionsTableViewCell.identifier)
        tableHeaderView = LastTransactionTableHeaderView(frame: CGRect(x: 0, y: 0, width: Frame.width, height: 60))
    }
    
}

extension TransactionTableView: UITableViewDelegate {
    
    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("SELECTED")
    }
    
}


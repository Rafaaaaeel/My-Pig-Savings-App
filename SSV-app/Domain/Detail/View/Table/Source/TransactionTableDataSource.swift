import UIKit



final internal class TransactionTableDataSource: DataSource {
    
    internal var sections: [Transactions] = []
    
    private var numberOfSection: Int {
        return sections.count > 3 ? 3 : sections.count
    }
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfSection
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LastTransactionsTableViewCell.identifier, for: indexPath) as? LastTransactionsTableViewCell else {
            return UITableViewCell()
        }
        
        cell.render(sections[indexPath.row])
        return cell
    }
    
    internal func select(row: Int) -> Transactions {
        return sections[row]
    }
    
}

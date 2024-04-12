import UIKit



public typealias DataSource = NSObject & UITableViewDataSource


final internal class GoalsTableDataSource: DataSource {
    
    internal var sections: [Goal] = []
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.count
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CardsTableViewCell.identifier, for: indexPath) as? CardsTableViewCell else {
            return UITableViewCell()
        }
        cell.render(sections[indexPath.row])
        return cell
    }
    
    internal func select(row: Int) -> Goal {
        return sections[row]
    }
    
}

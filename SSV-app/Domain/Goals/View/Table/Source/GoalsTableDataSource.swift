import UIKit



typealias DataSource = NSObject & UITableViewDataSource

internal protocol GoalsTableDataSourceDelegate: AnyObject {
    
    func reload()
    
}

final internal class GoalsTableDataSource: DataSource {
    
    internal var sections: [Goal] = [] {
        didSet {
            delegate?.reload()
        }
    }
    
    weak var delegate: GoalsTableDataSourceDelegate?
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.count
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
    
}

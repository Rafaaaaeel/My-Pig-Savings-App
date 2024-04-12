import UIKit



final internal class LastTransactionsTableViewCell: UITableViewCell, Reusable {
    
    private let transactionView = LastTransactionView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) { nil }
    
    internal func render(_ section: Transactions) {
        transactionView.render(section)
    }
    
}

extension LastTransactionsTableViewCell: CodableViews {
    
    func configView() {
        selectionStyle = .none
        backgroundColor = .clear
    }
    
    internal func setupHiearchy() {
        addSubviews(transactionView)
    }
    
    internal func setupContraints() {
        let cardViewConstraints = [
            transactionView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            transactionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            transactionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            transactionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ]
        
        NSLayoutConstraint.activate(cardViewConstraints)
    }
    
}

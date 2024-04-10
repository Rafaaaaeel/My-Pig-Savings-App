import UIKit



final internal class CardsTableViewCell: UITableViewCell, Reusable {
    
    private let cardView = CardView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) { nil }
    
    internal func render(_ section: Goal) {
        cardView.render(section)
    }
    
}

extension CardsTableViewCell: CodableViews {
    
    internal func setupHiearchy() {
//        selectionStyle = .none
        backgroundColor = .clear
        addSubview(cardView)
    }
    
    internal func setupContraints() {
        
        let cardViewConstraints = [
            cardView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            cardView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cardView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ]
        
        NSLayoutConstraint.activate(cardViewConstraints)
    }
    
}

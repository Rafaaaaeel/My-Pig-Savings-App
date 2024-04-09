import UIKit

final class CardsTableViewCell: UITableViewCell, Reusable {
    
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
    
    func setupHiearchy() {
        selectionStyle = .none
        addSubviews(cardView)
    }
    
    func setupContraints() {
        
        let cardViewConstraints = [
            cardView.topAnchor.constraint(equalTo: topAnchor),
            cardView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cardView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(cardViewConstraints)
    }
    
}

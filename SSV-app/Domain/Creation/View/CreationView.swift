import UIKit

final internal class CreationView: WhiteView {
    
    private lazy var cardView = CardView()
    private lazy var infoView = InfoView()
    
    internal override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) { nil }
    
}

extension CreationView: CodableViews {
    
    internal func setupHiearchy() {
        addSubviews(cardView, infoView)
    }
    
    internal func setupContraints() {
        let constraints = [
            cardView.topAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 5),
            cardView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            trailingAnchor.constraint(equalToSystemSpacingAfter: cardView.trailingAnchor, multiplier: 2),
            cardView.bottomAnchor.constraint(equalTo: infoView.topAnchor, constant: -20),
            
            infoView.topAnchor.constraint(equalTo: topAnchor, constant: Frame.height / 3),
            infoView.leadingAnchor.constraint(equalTo: leadingAnchor),
            infoView.trailingAnchor.constraint(equalTo: trailingAnchor),
            infoView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}

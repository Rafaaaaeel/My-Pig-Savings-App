import UIKit

final internal class CreationView: WhiteView {
    
    private lazy var cardView = CardView()
    private lazy var firstStepView = CreationFirstStepView()
    
    internal override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) { nil }
    
}

extension CreationView: CodableViews {
    
    internal func setupHiearchy() {
        addSubviews(cardView, firstStepView)
    }
    
    internal func setupContraints() {
        let constraints = [
            cardView.topAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 2),
            cardView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            trailingAnchor.constraint(equalToSystemSpacingAfter: cardView.trailingAnchor, multiplier: 2),
            cardView.bottomAnchor.constraint(equalTo: firstStepView.topAnchor, constant: -80),
            
            firstStepView.topAnchor.constraint(equalTo: topAnchor, constant: Frame.height / 3),
            firstStepView.leadingAnchor.constraint(equalTo: leadingAnchor),
            firstStepView.trailingAnchor.constraint(equalTo: trailingAnchor),
            firstStepView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}

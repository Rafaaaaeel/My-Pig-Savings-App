import UIKit

private typealias Text = Texts.Goals

final internal class GoalsTableHeaderView: WhiteView {
    
    private lazy var helloLabel: UILabel = {
        let label = UILabel()
        label.text = Text.TITLE
        label.numberOfLines = 1
        label.font = Fonts.subTitle
        label.textColor = ColorTheme.primaryAction
        return label
    }()
    
    internal override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) { nil }
    
}

extension GoalsTableHeaderView: CodableViews {
    
    internal func setupHiearchy() {
        addSubviews(helloLabel)
    }
    
    internal func setupContraints() {
        let constraints = [
            helloLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            helloLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 48),
            helloLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}


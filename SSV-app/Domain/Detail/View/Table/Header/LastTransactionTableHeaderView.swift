import UIKit


final internal class LastTransactionTableHeaderView: WhiteView {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "PAYMENTS"
        label.numberOfLines = 1
        label.font = Fonts.sfRegular
        label.textColor = ColorTheme.primaryTitle
        return label
    }()
    
    private lazy var squareView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorTheme.primaryFacelift
        view.layer.cornerRadius = 4
        return view
    }()
    
    private lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorTheme.primaryFacelift
        return view
    }()
    
    internal override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) { nil }
    
}

extension LastTransactionTableHeaderView: CodableViews {
    
    internal func setupHiearchy() {
        squareView.addSubviews(titleLabel)
        addSubviews(squareView, lineView)
    }
    
    internal func setupContraints() {
        let constraints = [
            lineView.heightAnchor.constraint(equalToConstant: 2),
            lineView.leadingAnchor.constraint(equalTo: leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: trailingAnchor),
            lineView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            titleLabel.centerXAnchor.constraint(equalTo: squareView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: squareView.centerYAnchor),
            
            squareView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            squareView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            squareView.widthAnchor.constraint(equalToConstant: 100),
            squareView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}


import UIKit


final class LastTransactionView: WhiteView {

    private lazy var contentStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 0
        stack.distribution = .equalSpacing
        return stack
    }()
    
    private lazy var textStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 4
        stack.distribution = .equalSpacing
        stack.alignment = .center
        return stack
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .black
        label.font = Fonts.sfRegular
        return label
    }()
 
    private lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        label.textColor = .black
        label.font = Fonts.sfRegular
        return label
    }()
  
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    internal override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) { nil }
    
    internal func render(_ transaction: Transactions) {
        let date = transaction.editionDate ?? Date()
        dateLabel.text = date.dateFormatted
        iconImageView.image = transaction.Operation == .increase ? Images.App.plus_green : Images.App.minus
        valueLabel.text = transaction.value?.decimalValue.asCurrencyValue
    }
    
}

extension LastTransactionView: CodableViews {
    
    internal func setupHiearchy() {
        textStackView.addArrangedSubviews(iconImageView, valueLabel)
        contentStackView.addArrangedSubviews(dateLabel, textStackView)
        addSubviews(contentStackView)
    }
    
    internal func setupContraints() {
        let constraints = [
            contentStackView.topAnchor.constraint(equalTo: topAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}

extension Date {
    
    var dateFormatted: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        return dateFormatter.string(from: self)
    }
    
}

extension UIView {
    func applyGradient(colors: [UIColor], startPoint: CGPoint = CGPoint(x: 0.5, y: 0.0), endPoint: CGPoint = CGPoint(x: 0.5, y: 1.0)) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
}

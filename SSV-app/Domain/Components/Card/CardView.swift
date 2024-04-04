import UIKit

private typealias Image = Images.Card
private typealias Text = Texts.Card

final internal class CardView: GreenView {
    
    private lazy var mainContentStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 16
//        stack.backgroundColor = .red
        return stack
    }()
    
    private lazy var centerContentStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 4
//        stack.backgroundColor = .red
        return stack
    }()
    
    private lazy var totalStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
//        stack.backgroundColor = .red
        stack.distribution = .equalSpacing
        return stack
    }()
    
    private lazy var savedStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
//        stack.backgroundColor = .red
        return stack
    }()
    
    private lazy var progressView = ProgressView(radius: 50, lineThickness: 7, lineColor: ColorTheme.primaryTitle)
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.text = "Car"
        label.textColor = ColorTheme.primaryAction
        label.font = Fonts.sfBold
        return label
    }()
    
    private lazy var totalLabel: UILabel = {
        let label = UILabel()
        label.text = Text.TOTAL
        label.numberOfLines = 1
        label.textColor = ColorTheme.primaryAction
        label.font = Fonts.sfRegular
        return label
    }()
    
    private lazy var totalValueLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.text = "R$ 1,00"
        label.textColor = ColorTheme.primaryTitle
        label.font = Fonts.sfRegular
        return label
    }()
    
    private lazy var savedLabel: UILabel = {
        let label = UILabel()
        label.text = Text.SAVED
//        label.isHidden = true
        label.numberOfLines = 1
        label.textColor = ColorTheme.primaryAction
        label.font = Fonts.sfRegular
        return label
    }()
    
    private lazy var savedValueLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.text = "R$ 2,00"
        label.textColor = ColorTheme.primaryTitle
        label.font = Fonts.sfRegular
        return label
    }()
    
    private lazy var plantsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = Image.plants
        return imageView
    }()
    
    internal override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) { nil }
    
}

extension CardView: CodableViews {
    
    internal func configView() {
        layer.cornerRadius = 25
        progressView.percentage = 0.4
    }
    
    internal func setupHiearchy() {
        totalStackView.addArrangedSubviews(totalLabel, totalValueLabel)
        savedStackView.addArrangedSubviews(savedLabel, savedValueLabel)
        centerContentStackView.addArrangedSubviews(totalStackView, savedStackView)
        mainContentStackView.addArrangedSubviews(nameLabel, centerContentStackView)
        addSubviews(progressView, mainContentStackView, plantsImageView)
    }
    
    internal func setupContraints() {
        let constraints = [
            progressView.centerYAnchor.constraint(equalTo: centerYAnchor),
            progressView.leadingAnchor.constraint(lessThanOrEqualToSystemSpacingAfter: leadingAnchor, multiplier: 10),
            
            mainContentStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            mainContentStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 140),
            mainContentStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -80),
            
            plantsImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            plantsImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}

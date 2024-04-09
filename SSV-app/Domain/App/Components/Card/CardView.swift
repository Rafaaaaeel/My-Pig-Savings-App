// MARK: - Imports
import UIKit

// MARK: - Alias
private typealias Image = Images.Card
private typealias Text = Texts.Card

// MARK: - View
final internal class CardView: GreenView {
    
    private lazy var mainContentStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 16
        return stack
    }()
    
    private lazy var centerContentStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 4
        return stack
    }()
    
    private lazy var totalStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        return stack
    }()
    
    private lazy var savedStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        return stack
    }()
    
    private lazy var progressView = ProgressView(radius: 50, lineThickness: 7, lineColor: ColorTheme.primaryTitle)
    
    private lazy var percentageLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.text = Text.ZERO_PERCENTAGE
        label.textColor = ColorTheme.primaryTitle
        label.font = Fonts.sfBoldBigger
        return label
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = ColorTheme.primaryAction
        label.font = Fonts.sfBold
        label.text = Text.NAME
        return label
    }()
    
    private lazy var totalLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.text = Text.TOTAL
        label.textColor = ColorTheme.primaryAction
        label.font = Fonts.sfRegular
        return label
    }()
    
    private lazy var totalValueLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.text = Text.ZERO_MONEY
        label.textColor = ColorTheme.primaryTitle
        label.font = Fonts.sfRegular
        return label
    }()
    
    private lazy var savedLabel: UILabel = {
        let label = UILabel()
        label.text = Text.SAVED
        label.numberOfLines = 1
        label.textColor = ColorTheme.primaryAction
        label.font = Fonts.sfRegular
        return label
    }()
    
    private lazy var savedValueLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.text = Text.ZERO_MONEY
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
    
    internal var totalText: String = .empty {
        didSet {
            totalValueLabel.text = totalText.isEmpty ? Text.ZERO_MONEY : totalText
        }
    }
    
    internal var nameText: String = .empty {
        didSet {
            nameLabel.text = nameText.isEmpty ? Text.NAME : nameText
        }
    }
    
    internal override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) { nil }
    
    internal func render(_ goal: Goal) {
        let total = goal.goal?.doubleValue ?? 0
        let saved = goal.value?.doubleValue ?? 0
        let percentual = (saved / total) * 100
        progressView.percentage = (saved / total)
        percentageLabel.text = "\(percentual)%"
        nameText = goal.name.orEmpty
        savedValueLabel.text = goal.value?.decimalValue.asCurrencyValue ?? .empty
        totalText = goal.goal?.decimalValue.asCurrencyValue ?? .empty
    }
    
}

// MARK: - CodableViews
extension CardView: CodableViews {
    
    internal func configView() {
        layer.cornerRadius = 25
        progressView.percentage = 0.0
    }
    
    internal func setupHiearchy() {
        totalStackView.addArrangedSubviews(totalLabel, totalValueLabel)
        savedStackView.addArrangedSubviews(savedLabel, savedValueLabel)
        centerContentStackView.addArrangedSubviews(totalStackView, savedStackView)
        mainContentStackView.addArrangedSubviews(nameLabel, centerContentStackView)
        progressView.addSubviews(percentageLabel)
        addSubviews(progressView, mainContentStackView, plantsImageView)
    }
    
    internal func setupContraints() {
        let constraints = [
            progressView.centerYAnchor.constraint(equalTo: centerYAnchor),
            progressView.leadingAnchor.constraint(lessThanOrEqualToSystemSpacingAfter: leadingAnchor, multiplier: 8),
            
            percentageLabel.centerXAnchor.constraint(equalTo: progressView.centerXAnchor),
            percentageLabel.centerYAnchor.constraint(equalTo: progressView.centerYAnchor),
            
            mainContentStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            mainContentStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 130),
            mainContentStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -80),
            
            plantsImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            plantsImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}

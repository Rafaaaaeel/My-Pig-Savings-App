import UIKit

private typealias Image = Images.Card
private typealias Text = Texts.Card

final internal class CardView: GreenView {
    
    private lazy var mainContentStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        
        return stack
    }()
    
    private lazy var progressView = ProgressView(radius: 50, lineThickness: 7, lineColor: ColorTheme.primaryTitle)
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = ColorTheme.primaryAction
        label.font = Fonts.subTitle
        return label
    }()
    
    private lazy var totalLabel: UILabel = {
        let label = UILabel()
        label.text = Text.TOTAL
        label.numberOfLines = 1
        label.textColor = ColorTheme.primaryAction
        label.font = Fonts.subTitle
        return label
    }()
    
    private lazy var totalValueLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = ColorTheme.primaryTitle
        label.font = Fonts.subTitle
        return label
    }()
    
    private lazy var savedLabel: UILabel = {
        let label = UILabel()
        label.text = Text.SAVED
        label.isHidden = true
        label.numberOfLines = 1
        label.textColor = ColorTheme.primaryAction
        label.font = Fonts.subTitle
        return label
    }()
    
    private lazy var savedValueLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = ColorTheme.primaryTitle
        label.font = Fonts.subTitle
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
        mainContentStackView.addArrangedSubviews(totalLabel, totalValueLabel)
        addSubviews(progressView, mainContentStackView, plantsImageView)
    }
    
    internal func setupContraints() {
        let constraints = [
            progressView.centerYAnchor.constraint(equalTo: centerYAnchor),
            progressView.leadingAnchor.constraint(lessThanOrEqualToSystemSpacingAfter: leadingAnchor, multiplier: 10),
            mainContentStackView.topAnchor.constraint(equalTo: progressView.topAnchor),
            mainContentStackView.leadingAnchor.constraint(equalTo: progressView.trailingAnchor),
            mainContentStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            mainContentStackView.trailingAnchor.constraint(equalTo: plantsImageView.leadingAnchor),
            plantsImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            plantsImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}

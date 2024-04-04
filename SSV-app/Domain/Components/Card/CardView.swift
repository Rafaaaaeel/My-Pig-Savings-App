import UIKit

private typealias Image = Images.Card

final internal class CardView: GreenView {
    
    private lazy var mainContentStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        return stack
    }()
    
    private lazy var progressView = ProgressView(radius: 50, lineThickness: 7, lineColor: ColorTheme.primaryTitle)
    
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
        
        addSubviews(progressView, plantsImageView)
    }
    
    internal func setupContraints() {
        let constraints = [
            progressView.centerYAnchor.constraint(equalTo: centerYAnchor),
            progressView.leadingAnchor.constraint(lessThanOrEqualToSystemSpacingAfter: leadingAnchor, multiplier: 10),
            
            plantsImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            plantsImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}
